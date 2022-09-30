import SwiftUI

struct ContentView: View {
    @State var coinX : CGFloat = 0
    @State var showCoin : Bool = true
    @State var carX : CGFloat = 0
    @State var circleY : CGFloat = -670
    @State var circleX : CGFloat = 25
    @State var showCircle : Bool = false
    @State var score = 0
    @State var count = 0
    var body: some View {
        VStack{
            HStack{
                Text("score: \(score)")
                Text("Count: \(count)")
            }
            
            ZStack(alignment: .bottom) {
                Rectangle()
                    .fill(.blue)
                Image(systemName:"airport.extreme.tower")
                    .font(.largeTitle)
                    .offset(x: carX)
                Image(systemName: "circle.fill")
                    .offset(x: circleX, y: circleY)
                    .foregroundColor(showCircle ? .white : .clear)
                ZStack(alignment: .top){
                    Color.clear
                    Image(systemName: "bitcoinsign.circle")
                        .font(.largeTitle)
                        .offset(x: coinX)
                        .foregroundColor(showCoin ? .white : .clear)
                }
            }
            .frame(width:450,height:700)
            
            HStack{
                Button{
                    carX -= 5
                }label: {
                    Image(systemName: "arrowshape.turn.up.backward")
                        .foregroundColor(.primary)
                }
                .keyboardShortcut("a",modifiers: [])
                
                Button("Attack"){
                    circleY = -30
                    circleX = carX
                    showCircle = true
                    withAnimation(.easeIn(duration: 0.5)) { 
                        circleY = -670
                    }
                    if  circleX-25<coinX && coinX<circleX+25{
                        withAnimation(.linear(duration: 0.1).delay(0.5)) { 
                            showCoin = false
                        }
                        score += 2
                        count += 1
                    } else{
                        score -= 5
                    }
                    withAnimation(.linear(duration: 0.1).delay(0.5)) { 
                        showCircle = false
                    }
                    withAnimation(.linear(duration: 0.1).delay(1)) { 
                        showCoin = true
                    }
                    
                }
                
                Button{
                    carX += 5
                }label: {
                    Image(systemName: "arrowshape.turn.up.right")
                        .foregroundColor(.primary)
                }
                .keyboardShortcut("d",modifiers: [])
                
            }
            Button("Start"){
                score = 0
                count = 0
            }
        }
    }
}
