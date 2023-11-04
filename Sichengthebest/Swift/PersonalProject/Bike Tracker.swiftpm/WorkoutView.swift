import SwiftUI
import MapKit

struct WorkoutView: View {
    @Environment(\.scenePhase) var scenePhase
    @Environment(\.dismiss) private var dismiss
    @State var isAlreadyPaused = true
    @State var progressTime = 0
    @State var followLocation = true
    @State var backAlert = false
    @State var isFirst = true
    @StateObject var lm = LocationManager.shared
    var tempCoords: [CLLocationCoordinate2D] {
        var tempTempCoords: [CLLocationCoordinate2D] = []
        for annotation in lm.placeList {
            tempTempCoords.append(annotation.coordinate)
        }
        return tempTempCoords
    }
    @State var beforeInactiveTime = Date.now
    @State var useInactiveTime = false
    @AppStorage("workouts") var workouts: [Workout] = []
    @AppStorage("sex") var sex = ""
    @AppStorage("weight") var weight = 0
    @AppStorage("age") var age = 0
    
    // Initializes timer
    let myTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "chevron.left")
                    .foregroundColor(.red)
                Text("Back")
                    .foregroundColor(.red)
            }.onTapGesture {
                if lm.isStarted == true {
                    backAlert = true
                } else {
                    dismiss()
                }
            }
            .alert("Are you sure you want to go back? Your workout will be canceled and saved.", isPresented: $backAlert){
                Button("OK"){
                    workouts.append(Workout(
                        time: progressTime,
                        endDate: Date.now,
                        speed: lm.totalDistance / 1000 * 3600 / Double(progressTime),
                        distance: lm.totalDistance / 1000, elevationGain: lm.elevationGain))
                    for annotation in lm.placeList {
                        workouts[workouts.count-1].addCoordToArray(coord: annotation.coordinate,distance:annotation.distanceAt)
                        workouts[workouts.count-1].addTimeToArray(time: annotation.time)
                    }
                    lm.placeList = []
                    lm.totalDistance = 0
                    progressTime = 0
                    lm.isRunning = false
                    lm.isStarted = false
                    dismiss()
                }
                Button("Cancel"){}
            }
            VStack {
                HStack {
                    Label("\(Stopwatch(progressTime: progressTime))", systemImage: "stopwatch")
                        .font(.system(size: 23))
                        .onReceive(myTimer) { _ in
                            // Adds to the timer every second
                            if lm.isRunning {
                                progressTime += 1
                            }
                        }
                        .padding()
                    Label("\(String(format: "%.2f",lm.totalDistance / 1000)) km", systemImage: "bicycle.circle")
                        .font(.system(size: 23))
                        .padding()
                }
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(Color.blue)
                            .frame(height: 55)
                        VStack {
                            Text("Average speed:")
                                .font(.system(size: 15))
                            if lm.totalDistance.isNaN {
                                Label("0.0 kph", systemImage: "speedometer")
                                    .font(.system(size: 20))
                            } else {
                                Label("\(String(format: "%.1f",lm.totalDistance / 1000 * 3600 / Double(progressTime))) kph", systemImage: "speedometer")
                                    .font(.system(size: 20))
                            }
                        }
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(Color.blue)
                            .frame(height: 55)
                        VStack {
                            Text("Current speed:")
                                .font(.system(size: 15))
                            Label("\(String(format: "%.1f",lm.currentSpeed*3.6)) kph", systemImage: "speedometer")
                                .font(.system(size: 20))
                        }
                    }
                }
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(Color.green)
                            .frame(height: 40)
                        Label("\(Int(lm.elevationGain))m", systemImage: "arrow.up.right.circle")
                            .font(.system(size: 20))
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(Color.green)
                            .frame(height: 40)
                        Label(" \(calcCals(sex:sex,weight:weight,age:age,time:progressTime,speed:lm.totalDistance / 1000 * 3600 / Double(progressTime) )) cal", systemImage: "flame")
                    }
                }
                    .font(.system(size: 20))
                Label(lm.isStarted ? lm.isRunning ? "Workout recording...":"Workout paused": "Start workout?", systemImage: lm.isStarted ? lm.isRunning ? "bicycle.circle" : "pause.circle" : "restart")
                    .font(.system(size: 17))
                    .foregroundColor(lm.isStarted ? lm.isRunning ? .green:.yellow:.blue)
                ZStack(alignment: .bottomTrailing) {
                    MapView(lineCoordinates: tempCoords, started: lm.isStarted, followLocation: followLocation,isFirst: isFirst)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                isFirst = false
                            }
                        }
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
                }
                HStack {
                    // Resume/Pause button
                    Button(action: {
                        lm.isRunning.toggle()
                        isAlreadyPaused.toggle()
                        lm.isStarted = true
                        lm.placeList.append(Annotation(coordinate: lm.currentLocation, distanceAt:lm.totalDistance,time: Date.now))
                    }) {
                        ButtonView(text: lm.isStarted ? lm.isRunning ? "Pause" : "Resume" : "Start",color: lm.isRunning ? .yellow : .green)
                    }
                    // End button
                    Button(action: {
                        if lm.isStarted == true {
                            workouts.append(Workout(
                                time: progressTime,
                                endDate: Date.now,
                                speed: lm.totalDistance / 1000 * 3600 / Double(progressTime),
                                distance: lm.totalDistance / 1000, elevationGain: lm.elevationGain))
                            for annotation in lm.placeList {
                                workouts[workouts.count-1].addCoordToArray(coord: annotation.coordinate,distance:annotation.distanceAt)
                                workouts[workouts.count-1].addTimeToArray(time: annotation.time)
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
                }
                .frame(height:90)
            }
        }
        .navigationBarBackButtonHidden(true)
        .padding()
        .onChange(of: scenePhase) { scenePhase in
            switch scenePhase{
            case .active:
                if lm.isRunning {
                    if useInactiveTime {
                        let interval = Int(Date().timeIntervalSinceReferenceDate - beforeInactiveTime.timeIntervalSinceReferenceDate)
                        progressTime += interval
                        useInactiveTime = false
                    }
                }
            case .background:
                beforeInactiveTime = Date.now
                useInactiveTime = true
                print("background")
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
