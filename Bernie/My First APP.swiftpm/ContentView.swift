import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            HStack {
                Image(systemName: "globe")
                    .resizable()
                    .scaledToFit()
    //                .imageScale(.large)
                    .foregroundColor(.accentColor)
            
                Text("Hello, world!")
                    .font(.largeTitle)
               
            }
            HStack {
                Image("happy")
                    .resizable()
                    .scaledToFit()
                Image("man")
                    .resizable()
                    .scaledToFit()
    //            Image("balls")
    //                .resizable()
    //                .scaledToFit()
            }
        }
    }
}
