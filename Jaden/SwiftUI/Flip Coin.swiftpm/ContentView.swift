import SwiftUI

struct ContentView: View {
    @State var coin = ["1","2","3","4","5","6"].randomElement()!
    @State var degress: Double = 0
    @State var isRunning = false
    @State var diceNumber : [String] = ["0","0","0"]
    var body: some View {
        VStack {
            VStack{
                Image(coin)
                    .resizable()
                    .scaledToFit()
                    .mask { 
                        Rectangle()
                    }
                    .rotation3DEffect(Angle(degrees: degress), axis: (x: 0.5, y: 0.6 , z: 0.5))
            }
            if isRunning{
                Text("Still Spinning")
                    .font(.title)
            }else{
                Text("\(coin)")
                    .font(.title)
                HStack{
                    Text("Numbers Rolled: \(diceNumber[0])")
//                    Text("\(diceNumber[1])")
//                    Text("\(diceNumber[2])")
                }
                
            }
            Button("Start"){
                diceNumber = []
                degress = 0
                isRunning = true
                for i in 1...3{
                    withAnimation(.easeIn(duration: 2.0)) { 
                        degress = 360
                        coin = ["1","2","3","4","5","6"].randomElement()!
                    }
                    withAnimation(.easeInOut(duration: 0.1).delay(0.5)) {
                        coin = ["1","2","3","4","5","6"].randomElement()!
                        
                        isRunning = false
                    }
                    withAnimation(.easeInOut(duration: 0.5).delay(1.0)){
                        print(coin)
                        diceNumber.append(coin)
                    }
                }
                
            }.buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
