// ------Stack------
// VStack
// HStack
// ZStack
// ------ Shape -----
// Rectangle
// Circle
// RoundedRectangle
// Capsule
// Ellipse
// ----- Modifier ---
// fill
// .stroke(.yellow, lineWidth: 20)
// ----- View ----
// Text
// .font
// .foregroundColor


import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            HStack{
                ZStack{
                    Rectangle()
                        .stroke(.yellow, lineWidth: 20)
                    Text("三个导弹鬼")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                }

                Circle()
                    .fill(.yellow)
            }
            HStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(.mint)
                Capsule()
                    .fill(.brown)
            }
            Ellipse()
                .fill(.gray)
        }
    }
}
