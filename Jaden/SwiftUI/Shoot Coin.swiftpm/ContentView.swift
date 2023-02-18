import SwiftUI

struct ContentView: View {
    @State var coinX : CGFloat = 0
    @State var coinY : CGFloat = 0
    @State var carX : CGFloat = 0
    @State var bulletY : CGFloat = -30
    @State var bulletX : CGFloat = 0
    @State var check  = false
    @State var hit = true
    @State var shots = 0
    @State var score = 0
    @State var time = 10
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var timeCheck = false
    func genPosition(){
        coinX = CGFloat.random(in: -200..<200)
        coinY = 0
    }
    var body: some View {
        VStack{
            HStack{
                Text("Shots Fired: \(shots)")
                Text("Score: \(score)")
                Text("Time: \(time) Seconds")
                    .onReceive(timer) { _ in
                        if timeCheck == true {
                            time += 1
                        }else{
                            time = 0
                        }
                    }
            }
            ZStack(alignment: .bottom) {
                Rectangle()
                    .fill(.blue)
                Image(systemName: "circle")
                    .font(.largeTitle)
                    .offset(x: bulletX, y: bulletY)
                    .foregroundColor(check ? .white : .clear)
                Image(systemName:"airport.extreme.tower")
                    .font(.largeTitle)
                    .offset(x: carX)
                ZStack(alignment: .top){
                    Color.clear
                    Image(systemName: "bitcoinsign.circle")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .offset(x: coinX, y: coinY)
                        .foregroundColor(hit ? .white : .clear)
                }
            }
            .frame(width:450,height:700)
            .onAppear{
                genPosition()
            }
            
            HStack{
                Button{
                    timeCheck = true
                    carX -= 5
                }label: {
                    Image(systemName: "arrowshape.turn.up.backward")
                        .foregroundColor(.primary)
                }
                .keyboardShortcut("a",modifiers: [])
                VStack{
                    Button("Attack"){
                        timeCheck = true
                        check = true
                        shots += 1
                        bulletX = carX
                        withAnimation(.easeInOut(duration: 0.5)){
                            bulletY = -670
                            
                        }
                        withAnimation(.easeInOut(duration: 0.5).delay(0.7)){
                            if bulletX >= coinX - 35 && bulletX <= coinX + 35{
                                hit = false 
                                score += 2
                            }else{
                                score -= 5
                            }
                        }
                        withAnimation(.easeInOut(duration: 0.0001).delay(1.2)){
                            check = false
                            bulletY = -30
                            if hit == false{
                                genPosition()
                            }
                            hit = true
                        }
                    }.keyboardShortcut(.space, modifiers: [])
                    Button("Restart Game"){
                        genPosition()
                        carX = 0
                        bulletY = -30
                        bulletX = 0
                        check  = false
                        hit = true
                        shots = 0
                        score = 0
                        timeCheck = false
                    }
                }
                
                
                Button{
                    timeCheck = true
                    carX += 5
                }label: {
                    Image(systemName: "arrowshape.turn.up.right")
                        .foregroundColor(.primary)
                }
                .keyboardShortcut("d",modifiers: [])
                
            }
        }
    }
}

