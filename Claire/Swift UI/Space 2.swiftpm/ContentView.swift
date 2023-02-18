import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.black
            VStack{
                Image("Rocket")
                Image("Earth")
                    .resizable()
                    .frame(width: 500, height: 500)
                    .offset(y: 200)
            }
        }
    }
}
