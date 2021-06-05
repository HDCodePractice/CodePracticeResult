import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    var body:some View{
        VStack{
            Text("Turtle Rock")
                .font(.title)
            HStack{
                Text("Joshua Tree National Park")
                    .font(.subheadline)
                Spacer()
                Text("California")
                    .font(.subheadline)
            }
        }
        .padding()
    }
}

PlaygroundPage.current.setLiveView(ContentView())

