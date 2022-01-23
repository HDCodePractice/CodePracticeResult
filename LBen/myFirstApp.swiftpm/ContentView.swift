import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")


        }
        HStack {
            Image("wave").resizable().frame(width: 30.0, height: 33.0, alignment: .center)
            Image("wave").resizable().frame(width: 30.0, height: 30.0, alignment: .center)
        }

    }
}
