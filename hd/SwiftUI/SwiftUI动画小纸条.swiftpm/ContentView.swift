import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            List{
                NavigationLink("1.Animation Modifier"){
                    AnimationModifierView()
                }
                NavigationLink("2.WithAination Method"){
                    AnimationModifierView()
                }
                
            }
        }
    }
}
