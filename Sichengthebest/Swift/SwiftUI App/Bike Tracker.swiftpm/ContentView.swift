import SwiftUI

struct ContentView: View {
    @State var startDate = Date()
    var body: some View {
        VStack {
            WorkoutView()
        }
    }
}
