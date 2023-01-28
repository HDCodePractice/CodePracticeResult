import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 5))
                .frame(width: 150, height: 150)
            VStack{
                Image(systemName: "arrow.up")
                    .resizable()
                    .frame(width: 50, height: 50)
                Text("BY LIQUID")
                    .bold()
                Text("empty to full")
            }
        }
        HStack{
            BottleView(height: 1, liquid: 1, cap: 1)
            BottleView(height: 2, liquid: 2, cap: 2)
            BottleView(height: 3, liquid: 3, cap: 3)
        }
    }
}
