import SwiftUI
import MapKit

struct MainView: View {
    @State var startDate = Date()
    @State private var region2 = MKCoordinateRegion(center: LocationManager.shared.currentLocation, span: MKCoordinateSpan(
        latitudeDelta: 0.05, longitudeDelta: 0.05
    ))
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to Sichengthebest's workout tracker!")
                    .font(.system(size:30))
                    .multilineTextAlignment(.center)
                // Workout view button
                NavigationLink {
                    WorkoutView()
                } label: {
                    VStack {
                        RectButtonView(text: "Start a workout",image:"bicycle.circle", color: .green)
                            .frame(height:30)
                        Map(coordinateRegion: $region2, showsUserLocation: true, userTrackingMode: .constant(.follow))
                            .frame(height:300)
                    }
                    
                }
                .padding()
                // Previous workouts button
                NavigationLink {
                    PreviousWorkoutsView()
                } label: {
                    RectButtonView(text: "View your previous workouts",image:"clock.arrow.circlepath", color: .blue)
                        .frame(height:30)
                }
                .padding()
                NavigationLink {
                    Settings()
                } label: {
                    RectButtonView(text: "Personal Settings",image:"gear", color: .gray)
                        .frame(height:30)
                }
                .padding()
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
