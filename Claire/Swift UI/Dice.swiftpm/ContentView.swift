import SwiftUI

struct ContentView: View {
    @State var face = ["Dice 1","Dice 3", "Dice 4", "Dice 6"].randomElement()!
    @State var degress: Double = 0
    @State var isRunning = false
    @State var score = 0
    var body: some View {
        VStack {
            VStack{
                HStack{
                    Image(face)
                        .resizable()
                        .scaledToFit()
                        .mask { 
                            Rectangle()
                        }
                        .rotation3DEffect(Angle(degrees: degress), axis: (x:1,y:0,z:0))
                    Image(face)
                        .resizable()
                        .scaledToFit()
                        .mask { 
                            Rectangle()
                        }
                        .rotation3DEffect(Angle(degrees: degress), axis: (x:1,y:0,z:0))
                    Image(face)
                        .resizable()
                        .scaledToFit()
                        .mask { 
                            Rectangle()
                        }
                        .rotation3DEffect(Angle(degrees: degress), axis: (x:1,y:0,z:0))
                }
            }
            if isRunning{
                Text("正在翻转")
                    .font(.title)
            }
            Button("Start"){
                degress = 0
                isRunning = true
                withAnimation(.easeIn(duration: 0.5)) { 
                    degress = 720*2
                    face = ["Dice 1","Dice 3", "Dice 4", "Dice 6"].randomElement()!
                }
                withAnimation(.easeInOut(duration: 0.1).delay(0.5)) {
                    face = ["Dice 1","Dice 3", "Dice 4", "Dice 6"].randomElement()!
                    isRunning = false
                }
            }.buttonStyle(.borderedProminent)
            
            Text("\(score)")
        }
        .padding()
    }
}
