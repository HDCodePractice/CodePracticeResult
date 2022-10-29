import SwiftUI
import MapKit

struct SingleWorkoutView: View {
    @AppStorage("workouts") var workouts: [Workout] = []
    @Environment(\.presentationMode) var presentationMode
    var index: Int
    var body: some View {        
        VStack {
            if workouts.count >= 1 {
                if index < workouts.count {
                    // Date of workout
                    Text("\(workouts[index].date,style: .date)")
                        .foregroundColor(.yellow)
                        .font(.system(size: 25))
                    // Time the workout has taken
                    Text("Time: \(Stopwatch(progressTime: workouts[index].time))")
                        .font(.system(size: 20))
                    // Average speed of bike ride
                    Text("Speed: \(String(format:"%.1f", workouts[index].speed)) kph")
                        .font(.system(size: 20))
                    // Distance of bike ride
                    Text("Distance: \(String(format: "%.2f",workouts[index].distance)) km")
                        .font(.system(size: 20))
                    // Map
                    NotMovingMapView(lineCoordinates: workouts[index].coordinates,beforePauses: workouts[index].beforePauses, region: MKCoordinateRegion(center: workouts[index].coordinates[0], span: MKCoordinateSpan(
                        latitudeDelta: 0.04, longitudeDelta: 0.04)), ended: true)
                    RectButtonView(text:"Delete this workout",color:.red)
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

