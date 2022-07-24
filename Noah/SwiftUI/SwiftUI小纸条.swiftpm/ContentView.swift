import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("1. Animation Modifier") {
                    AnimationModifier()
                }
                NavigationLink("2. With Animation Method") {
                    WithAnimationView()
                }
            }
        }
    }
}
