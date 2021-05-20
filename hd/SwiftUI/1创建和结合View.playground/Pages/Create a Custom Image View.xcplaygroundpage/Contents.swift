import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    var body: some View{
        Image(uiImage: UIImage(named: "turtlerock@2x.jpg")!)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray,lineWidth: 4))
    }
}

PlaygroundPage.current.setLiveView(ContentView())
