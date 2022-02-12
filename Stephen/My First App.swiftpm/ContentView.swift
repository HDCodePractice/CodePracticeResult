import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            HStack {
                Image(systemName: "globe")
                    .resizable()
                    .scaledToFit()
    //                .imageScale(.large)
                    .foregroundColor(.green)
                Text("Hello, world!")
                    .font(.largeTitle)
                    .fontWeight(.ultraLight)
                    .foregroundColor(Color.blue)
                Image("brand")
                    .resizable()
                    .scaledToFit()
            }
            HStack {
                Image("jacky")
                    .resizable()
                    .scaledToFit()
                Image("sunset")
                    .resizable()
                    .scaledToFit()
            }
        }
    }
}
