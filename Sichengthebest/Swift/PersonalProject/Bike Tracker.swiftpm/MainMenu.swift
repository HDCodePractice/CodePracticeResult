import SwiftUI

struct MainView: View {
    @State var startDate = Date()
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to Sichengthebest's bike tracker!")
                    .font(.system(size:30))
                    .multilineTextAlignment(.center)
                // Workout view button
                NavigationLink {
                    WorkoutView()
                } label: {
                    ButtonView(text: "Start a workout", color: .green)
                }
                // Previous workouts button
                Spacer(minLength: 25)
                NavigationLink {
                    PreviousWorkoutsView()
                } label: {
                    ButtonView(text: "View your previous\nworkouts", color: .blue)
                }
                Spacer(minLength: 40)
            }
        }
        .padding()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
