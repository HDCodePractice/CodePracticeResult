import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack{
                Image(systemName: "globe")
                    .resizable()
                    .scaledToFit()
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
            }
            HStack{
                Image("1024")
                    .resizable()
                    .scaledToFit()
                Image("376")
                    .resizable()
                    .scaledToFit()
            }
        }
    }
}
