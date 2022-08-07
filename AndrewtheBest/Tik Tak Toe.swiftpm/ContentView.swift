import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Text("Joe").font(.largeTitle)
            Rectangle().fill(.indigo)
            ZStack{
                Circle().stroke(.yellow, lineWidth: 20)
                Text("Blue")
            }
        }
        HStack{
            RoundedRectangle(cornerRadius: 20).fill(.yellow)
            Capsule().fill(.cyan)
        }
        VStack{
            Ellipse().fill(.red).foregroundColor(.yellow)
        }
    }
}


