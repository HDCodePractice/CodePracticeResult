import SwiftUI

struct ContentView: View {
    @State var coin = ["1","2","3","4","5","6"].randomElement()!
    @State var coin1 = ["1","2","3","4","5","6"].randomElement()!
    @State var coin2 = ["1","2","3","4","5","6"].randomElement()!
    @State var degress: Double = 0
    @State var isRunning = false
    @State var diceNumber : [String] = ["0"]
    @State var diceNumber1 : [String] = ["0"]
    @State var diceNumber2 : [String] = ["0"]
    @State var sum = 0
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
                Image(coin1)
                    .resizable()
                    .scaledToFit()
                    .mask { 
                        Rectangle()
                    }
                    .rotation3DEffect(Angle(degrees: degress), axis: (x: 0.5, y: 0.6 , z: 0.5))
                Image(coin2)
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
                Text("\(sum)")
                    .font(.title)
                Text("Numbers Rolled: \(diceNumber[0]) \(diceNumber1[0]) \(diceNumber2[0])")
            }
            Button("Start"){
                diceNumber = []
                sum = 0
                degress = 0
                isRunning = true
                withAnimation(.easeIn(duration: 2.0)) { 
                    degress = 360
                    coin = ["1","2","3","4","5","6"].randomElement()!
                    print(coin,"1")
                }
                withAnimation(.easeInOut(duration: 0.1).delay(2.0)) {
                    coin = ["1","2","3","4","5","6"].randomElement()!
                    print(coin,"2")
                    diceNumber.append(coin)
                    print(diceNumber[0])
                    isRunning = false
                }
                withAnimation(.easeIn(duration: 2.0).delay(3.0)) { 
                    degress = 360
                    coin1 = ["1","2","3","4","5","6"].randomElement()!
                    print(coin1,"3")
                }
                withAnimation(.easeInOut(duration: 0.1).delay(2.0)) {
                    coin1 = ["1","2","3","4","5","6"].randomElement()!
                    print(coin1,"4")
                    diceNumber1 = []
                    diceNumber1.append(coin1)
                    print(diceNumber1[0])
                    isRunning = false
                }
                withAnimation(.easeIn(duration: 2.0).delay(3.0)) { 
                    degress = 360
                    coin2 = ["1","2","3","4","5","6"].randomElement()!
                    print(coin2,"5")
                }
                withAnimation(.easeInOut(duration: 0.1).delay(2.0)) {
                    coin2 = ["1","2","3","4","5","6"].randomElement()!
                    print(coin,"6")
                    diceNumber2 = []
                    diceNumber2.append(coin2)
                    print(diceNumber2[0])
                    isRunning = false
                }
                sum = Int(diceNumber[0]) ?? 0
                sum += Int(diceNumber1[0]) ?? 0
                sum +=  Int(diceNumber2[0]) ?? 0
            }.buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
