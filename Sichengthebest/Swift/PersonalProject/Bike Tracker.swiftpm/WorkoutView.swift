import SwiftUI
import MapKit

struct WorkoutView: View {
    @Environment(\.scenePhase) var scenePhase
    @State var isRunning = false
    @State var isStarted = false
    @State var isAlreadyPaused = true
    @State var progressTime = 0
    @AppStorage("workouts") var workouts: [Workout] = []
    // Initializes timer
    let myTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack {
            Label("\(Stopwatch(progressTime: progressTime))  |  \(String(format: "%.2f",LocationManager.shared.totalDistance / 1000)) km", systemImage: "bicycle.circle")
                .font(.system(size: 25))
                .onReceive(myTimer) { _ in
                    // Adds to the timer every second
                    if isRunning {
                        progressTime += 1
                    }
                }
            Label("Average speed: \(String(format: "%.1f",LocationManager.shared.totalDistance / 1000 * 3600 / Double(progressTime))) kph\nCurrent speed: \(String(format: "%.1f",LocationManager.shared.currentSpeed)) kph", systemImage: "speedometer")
                .font(.system(size: 25))
            Label(isStarted ? isRunning ? "Workout recording...":"Workout paused": "Start workout?", systemImage: isStarted ? isRunning ? "bicycle.circle" : "pause.circle" : "restart")
                .font(.system(size: 20))
                .foregroundColor(isStarted ? isRunning ? .green:.yellow:.blue)
            Text("Annotations: \(LocationManager.shared.placeList.count)")
            MapView(lineCoordinates: LocationManager.shared.placeList, region: MKCoordinateRegion(
                center: LocationManager.currentLocation, span: MKCoordinateSpan(
                    latitudeDelta: 0.05, longitudeDelta: 0.05
                )
            ), ended: isStarted)
            HStack {
                // Resume/Pause button
                Button(action: {
                    isRunning.toggle()
                    isAlreadyPaused.toggle()
                    isStarted = true
                    LocationManager.shared.placeList.append(LocationManager.currentLocation)
                }) {
                    ButtonView(text: isStarted ? isRunning ? "Pause" : "Resume" : "Start",color: isRunning ? .yellow : .green)
                }
                // End button
                Button(action: {
                    if isStarted == true {
                        workouts.append(Workout(
                            time: progressTime, 
                            date: Date.now,
                            speed: LocationManager.shared.totalDistance / 1000 * 3600 / Double(progressTime), 
                            distance: LocationManager.shared.totalDistance / 1000))
                        for annotation in LocationManager.shared.placeList {
                            workouts[workouts.count-1].addCoordToArray(coord: annotation)
                        }
                    }
                    LocationManager.shared.placeList = []
                    progressTime = 0
                    isRunning = false
                    isStarted = false
                    print(workouts)
                }) {
                    ButtonView(text: "End",color: .red)
                }
            }.frame(height:90)
        }
        .padding()
        .onChange(of: scenePhase) { scenePhase in
            switch scenePhase{
            case .active:
                if isStarted {
                    if isAlreadyPaused == true {
                        isRunning = true
                        LocationManager.shared.placeList.append(LocationManager.currentLocation)
                    }
                }
            case .background:
                if isStarted {
                    isRunning = false
                    LocationManager.shared.placeList.append(LocationManager.currentLocation)
                }
            case .inactive:
                print("app inactive")
            default:
                print("wa")
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
    
    /// Increase progressTime each second
    return "\(hours):\(minutes):\(seconds)"
}
