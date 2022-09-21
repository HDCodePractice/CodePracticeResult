import SwiftUI
import MapKit

struct PreviousWorkoutsView: View {
    @AppStorage("workouts") var workouts: [Workout] = []
    var body: some View {
        VStack {
            Text("Your previous workouts:")
                .font(.system(size:30))
            ForEach(0..<workouts.count,id:\.self) { index in
                // Display each workout as a separate window
                NavigationLink {
                    VStack {
                        Text("\(workouts[index].date,style: .date)")
                            .foregroundColor(.yellow)
                            .font(.system(size: 25))
                        Text("Time: \(Stopwatch(progressTime: workouts[index].time))")
                            .font(.system(size: 20))
                        Text("Speed: \(String(format:"%.1f", workouts[index].speed)) kph")
                            .font(.system(size: 20))
                        Text("Distance: \(String(format: "%.2f",workouts[index].distance)) km")
                            .font(.system(size: 20))
                        MapView(lineCoordinates: workouts[index].coordinates, region: MKCoordinateRegion(
                            center: workouts[index].coordinates[0], span: MKCoordinateSpan(
                                latitudeDelta: 0.05, longitudeDelta: 0.05
                            )
                        ), ended: true)
                        RectButtonView(text:"Delete this workout",color:.red)
                            .frame(height:20)
                            .onTapGesture {
                                workouts.remove(at: index)
                            }
                            .padding()
                    }
                } label: {
                    // Rectangular text displaying each workout
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 40)
                            .foregroundColor(.blue)
                        HStack {
                            Text("\(workouts[index].date,style: .date)")
                                .foregroundColor(.black)
                                .font(.system(size: 20))
                            Text("\(String(format: "%.2f",workouts[index].distance)) km")
                                .foregroundColor(.black)
                                .font(.system(size: 18))
                        }
                    }
                }
            }
        }
    }
}

struct PreviousWorkoutsView_Previews: PreviewProvider {
    static var previews: some View {
        PreviousWorkoutsView()
    }
}
