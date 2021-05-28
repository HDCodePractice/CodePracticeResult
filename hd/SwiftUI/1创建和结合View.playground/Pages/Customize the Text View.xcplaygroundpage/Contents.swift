import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    var body:some View{
        Text("Hello SwiftUI")
            .font(.title)
            .foregroundColor(.green)
    }
}

PlaygroundPage.current.setLiveView(ContentView())
    
