import SwiftUI
import MapKit

struct WorkoutView: View {
    @Environment(\.scenePhase) var scenePhase
    @State var isAlreadyPaused = true
    @State var progressTime = 0
    @State var followLocation = true
    @StateObject var lm = LocationManager.shared
    var tempCoords: [CLLocationCoordinate2D] {
        var tempTempCoords: [CLLocationCoordinate2D] = []
        for annotation in lm.placeList {
            tempTempCoords.append(annotation.coordinate)
        }
        return tempTempCoords
    }
    var tempBools: [Bool] {
        var tempTempBools: [Bool] = []
        for annotation in lm.placeList {
            tempTempBools.append(annotation.beforePause)
        }
        return tempTempBools
    }
    @AppStorage("workouts") var workouts: [Workout] = []
    // Initializes timer
    let myTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack {
            Label("\(Stopwatch(progressTime: progressTime))  |  \(String(format: "%.2f",lm.totalDistance / 1000)) km", systemImage: "bicycle.circle")
                .font(.system(size: 25))
                .onReceive(myTimer) { _ in
                    // Adds to the timer every second
                    if lm.isRunning {
                        progressTime += 1
                    }
                }
            Label("Average speed: \(String(format: "%.1f",lm.totalDistance / 1000 * 3600 / Double(progressTime))) kph\nCurrent speed: \(String(format: "%.1f",lm.currentSpeed)) kph", systemImage: "speedometer")
                .font(.system(size: 25))
            Label(lm.isStarted ? lm.isRunning ? "Workout recording...":"Workout paused": "Start workout?", systemImage: lm.isStarted ? lm.isRunning ? "bicycle.circle" : "pause.circle" : "restart")
                .font(.system(size: 20))
                .foregroundColor(lm.isStarted ? lm.isRunning ? .green:.yellow:.blue)
            Text("Annotations: \(lm.placeList.count)")
            ZStack(alignment: .bottomTrailing) {
                MapView(lineCoordinates: tempCoords, beforePauses: tempBools, region: lm.currentRegion, ended: lm.isStarted)
                ZStack {
                    Circle()
                        .foregroundColor(.white)
                    Image(systemName: followLocation ? "location.fill": "location")
                        .foregroundColor(.blue)
                }
                .onTapGesture {
                    followLocation.toggle()
                }
                .frame(width: 50, height: 50)
                    .padding()
            }
            HStack {
                // Resume/Pause button
                Button(action: {
                    lm.isRunning.toggle()
                    isAlreadyPaused.toggle()
                    lm.isStarted = true
                    lm.placeList.append(Annotation(coordinate: lm.currentLocation,beforePause: !lm.isRunning))
                }) {
                    ButtonView(text: lm.isStarted ? lm.isRunning ? "Pause" : "Resume" : "Start",color: lm.isRunning ? .yellow : .green)
                }
                // End button
                Button(action: {
                    if lm.isStarted == true {
                        workouts.append(Workout(
                            time: progressTime, 
                            date: Date.now,
                            speed: lm.totalDistance / 1000 * 3600 / Double(progressTime),
                            distance: lm.totalDistance / 1000, beforePauses: tempBools))
                        for annotation in lm.placeList {
                            workouts[workouts.count-1].addCoordToArray(coord: annotation.coordinate)
                        }
                    }
                    lm.placeList = []
                    lm.totalDistance = 0
                    progressTime = 0
                    lm.isRunning = false
                   lm.isStarted = false
                }) {
                    ButtonView(text: "End",color: .red)
                }
            }.frame(height:90)
        }
        .padding()
        .onChange(of: scenePhase) { scenePhase in
            switch scenePhase{
            case .active:
                if lm.isStarted {
                    if isAlreadyPaused == true {
                        lm.isRunning = true
                        lm.placeList.append(Annotation(coordinate:lm.currentLocation,beforePause: false))
                    }
                }
            case .background:
                if lm.isStarted {
                    lm.isRunning = false
                    lm.placeList.append(Annotation(coordinate:lm.currentLocation,beforePause: true))
                }
            case .inactive:
                print("app inactive")
            default:
                print("error")
            }
        }
    }
}


struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView()
    }
}

func Stopwatch(progressTime:Int) -> String {
    var hours: String {
        if progressTime / 3600 < 10 {
            return "0\(progressTime / 3600)"
        } else {
            return "\(progressTime / 3600)"
        }
    }
    
    var minutes: String {
        if (progressTime % 3600) / 60 < 10 {
            return "0\((progressTime % 3600) / 60)"
        } else {
            return "\((progressTime % 3600) / 60)"
        }
    }
    
    var seconds: String {
        if progressTime % 60 < 10 {
            return "0\(progressTime % 60)"
        } else {
            return "\(progressTime % 60)"
        }
    }
    return "\(hours):\(minutes):\(seconds)"
}
