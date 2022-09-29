import SwiftUI
import MapKit

struct PreviousWorkoutsView: View {
    @AppStorage("workouts") var workouts: [Workout] = []
    var body: some View {
        VStack {
            Text("Your previous workouts:")
                .font(.system(size:30))
            Divider()
            if workouts.count >= 1 {
                ForEach(0..<workouts.count,id:\.self) { index in
                    // Display each workout as a separate window
                    NavigationLink {
                        SingleWorkoutView(index: index)
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
            } else {
                Text("You have no workouts to display. Go to \"Start a workout\" to start a new workout.")
            }
        }
    }
}

struct SingleWorkoutView: View {
    @AppStorage("workouts") var workouts: [Workout] = []
    @Environment(\.presentationMode) var presentationMode
    var index: Int
    var body: some View {
        VStack {
            if workouts.count >= 1 {
                if index < workouts.count {
                    Text("\(workouts[index].date,style: .date)")
                        .foregroundColor(.yellow)
                        .font(.system(size: 25))
                    Text("Time: \(Stopwatch(progressTime: workouts[index].time))")
                        .font(.system(size: 20))
                    Text("Speed: \(String(format:"%.1f", workouts[index].speed)) kph")
                        .font(.system(size: 20))
                    Text("Distance: \(String(format: "%.2f",workouts[index].distance)) km")
                        .font(.system(size: 20))
                    MapView(lineCoordinates: workouts[index].coordinates,beforePauses: workouts[index].beforePauses, region: MKCoordinateRegion(
                        center: workouts[index].coordinates[0], span: MKCoordinateSpan(
                            latitudeDelta: 0.05, longitudeDelta: 0.05
                        )
                    ), ended: true)
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

struct WorkoutsViewModel {
    
}

struct PreviousWorkoutsView_Previews: PreviewProvider {
    static var previews: some View {
        PreviousWorkoutsView()
    }
}
