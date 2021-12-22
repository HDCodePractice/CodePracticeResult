import SwiftUI

struct ContentView: View {
    var body: some View {
        
        HStack{
            Image("MyHead")
                .resizable()
                .frame(width: 100.0, height: 100.0)
                .scaledToFit()
            VStack{
                Text("Hello, world!")
                    .font(.title)
                    .foregroundColor(Color.blue)
                Text("Hello, Claire!")
                    .foregroundColor(Color.red)
            }
        }
    }
}
