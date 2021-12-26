import SwiftUI

struct ContentView: View {
    var body: some View {
    HStack{
        Image("MyHead")
            .resizable()
            .scaledToFit()
            .padding()
        VStack{
            Text("Hello, world!")
                .font(.title)
                .foregroundColor(Color.blue)
            Text("Hello, HD!")
                .foregroundColor(Color.red)
            }
        }
    }
}
