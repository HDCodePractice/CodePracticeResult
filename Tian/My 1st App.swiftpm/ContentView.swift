import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack{
            Image(systemName: "globe")
                .resizable()
                .scaledToFit()
//                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
                
            }
            HStack {
                Image("happy")
                .resizable()
                .scaledToFit()
                Image("happy")
                .resizable()
                .scaledToFit()
//            Image("happy")
//                .resizable()
//                .scaledToFit()
            }
        }
    }
}
