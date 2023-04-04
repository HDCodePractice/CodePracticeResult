import SwiftUI
import MapKit

struct SingleWorkoutView: View {
    @AppStorage("workouts") var workouts: [Workout] = []
    @AppStorage("sex") var sex = ""
    @AppStorage("weight") var weight = 0
    @AppStorage("age") var age = 0
    @Environment(\.presentationMode) var presentationMode
    @State var open: Bool = false
    var index: Int
    var splits: [CLLocationCoordinate2D] = []
    var body: some View {        
        VStack {
            if workouts.count >= 1 {
                if index < workouts.count {
                    // Date of workout
                    Text("\(workouts[index].endDate,style: .date)")
                        .foregroundColor(.yellow)
                        .font(.system(size: 25))
                    // Time the workout has taken
                    Text("Workout time: \(Stopwatch(progressTime: workouts[index].time))")
                        .font(.system(size: 20))
                    Text("Elapsed time: \(Stopwatch(progressTime: Int(workouts[index].endDate.timeIntervalSinceReferenceDate - workouts[index].startDate.timeIntervalSinceReferenceDate)))")
                        .font(.system(size: 20))
                    // Average speed of bike ride
                    Text("Speed: \(String(format:"%.1f", workouts[index].speed)) kph")
                        .font(.system(size: 20))
                    Text("Elevation gain: \(Int(workouts[index].elevationGain))m")
                        .font(.system(size: 20))
                    // Calories
                    Text("Calories: \(calcCals(sex: sex, weight: weight, age: age, time: workouts[index].time, speed: workouts[index].speed)) cal")
                        .font(.system(size: 20))
                    // Distance of bike ride
                    HStack {
                        Text("Distance: \(String(format: "%.2f",workouts[index].distance)) km")
                        Image(systemName: open ? "arrowtriangle.down.circle.fill" : "arrowtriangle.forward.circle.fill")
                            .onTapGesture {
                                open.toggle()
                            }
                    }
                        .font(.system(size: 20))
                    if open {
                        Text("Splits:")
                        ForEach(0..<workouts[index].coordinates2.count,id:\.self) { km in
                            Text("\(km+1): \(getAllTimes(workout:workouts[index],km:km))")
                        }
                    }
                    // Map
                    NotMovingMapView(lineCoordinates: workouts[index].coordinates, region: MKCoordinateRegion(center: workouts[index].coordinates[0], span: MKCoordinateSpan(
                        latitudeDelta: 0.04, longitudeDelta: 0.04)))
                    RectButtonView(text:"Delete this workout",image: "trash",color:.red)
                        .frame(height:20)
                        .onTapGesture {
                            if workouts.count != 0 {
                                workouts.remove(at: index)
                                presentationMode.wrappedValue.dismiss()
                            }
                        }
                        .padding()
                }
            }
        }
    }
}

struct PastWorkoutsView_Previews: PreviewProvider {
    static var previews: some View {
        SingleWorkoutView(index: 0)
    }
}

func getAllTimes(workout:Workout,km:Int) -> String {
    var difference: Int = 0
    if km == 0 {
        difference = Int(workout.times[km].last!.timeIntervalSinceReferenceDate - workout.startDate.timeIntervalSinceReferenceDate)
    } else if km == workout.coordinates2.count-1 {
        difference = Int(workout.endDate.timeIntervalSinceReferenceDate - workout.times[km-1].last!.timeIntervalSinceReferenceDate)
    } else {
        difference = Int(workout.times[km].last!.timeIntervalSinceReferenceDate - workout.times[km-1].last!.timeIntervalSinceReferenceDate)
    }
    return Stopwatch(progressTime: difference)
}

