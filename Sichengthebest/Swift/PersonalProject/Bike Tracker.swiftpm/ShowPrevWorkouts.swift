import SwiftUI
import MapKit

struct PreviousWorkoutsView: View {
    @AppStorage("workouts") var workouts: [Workout] = []
    var body: some View {
        NavigationView {
            VStack {
                Text("Your previous workouts:")
                    .font(.system(size:30))
                ForEach(workouts) { workout in
                    NavigationLink {
                        VStack {
                            Text("\(workout.date,style: .date)")
                                .foregroundColor(.yellow)
                                .font(.system(size: 25))
                            Text("Time: \(Stopwatch(progressTime: workout.time))")
                                .font(.system(size: 20))
                            Text("Speed: \(String(format:"%.1f", workout.speed)) kph")
                                .font(.system(size: 20))
                            Text("Distance: \(String(format: "%.2f",workout.distance)) km")
                                .font(.system(size: 20))
                            MapView(lineCoordinates: workout.coordinates, region: MKCoordinateRegion(
                                center: workout.coordinates[0], span: MKCoordinateSpan(
                                    latitudeDelta: 0.05, longitudeDelta: 0.05
                                )
                            ), ended: true)
                            .padding()
                        }
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 40)
                                .foregroundColor(.blue)
                            HStack {
                                Text("\(workout.date,style: .date)")
                                    .foregroundColor(.black)
                                    .font(.system(size: 20))
                                Text("\(String(format: "%.2f",workout.distance)) km")
                                    .foregroundColor(.black)
                                    .font(.system(size: 18))
                            }
                            
                        }
                        
                    }
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct PreviousWorkoutsView_Previews: PreviewProvider {
    static var previews: some View {
        PreviousWorkoutsView()
    }
}
