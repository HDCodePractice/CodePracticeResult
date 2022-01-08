import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            Image("Image 1")
                .resizable()
                .frame(width: 100.0, height: 100.0)
                .scaledToFit()
            VStack{
                Text("Hello, world!")
                    .font(.title)
                    .foregroundColor(Color.blue)
                Text("Hello James")
                    .foregroundColor(Color.red)
            }
        }
    }
}
