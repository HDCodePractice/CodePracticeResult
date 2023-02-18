import SwiftUI
import MapKit

struct PreviousWorkoutsView: View {
    @AppStorage("workouts") var workouts: [Workout] = []
    var body: some View {
        ScrollView {
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
                                    Text("\(workouts[index].endDate,style: .date)")
                                        .foregroundColor(.black)
                                        .font(.system(size: 17))
                                    Text("\(String(format: "%.2f",workouts[index].distance)) km")
                                        .foregroundColor(.black)
                                        .font(.system(size: 20))
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
}

struct PreviousWorkoutsView_Previews: PreviewProvider {
    static var previews: some View {
        PreviousWorkoutsView()
    }
}
