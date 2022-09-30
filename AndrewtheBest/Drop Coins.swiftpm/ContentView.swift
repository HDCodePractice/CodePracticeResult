import SwiftUI

struct ContentView: View {
    @State var coinX : CGFloat = 0
    @State var showCoin : Bool = true
    @State var CannonX : CGFloat = 0
    @State var circleY : CGFloat = -670
    @State var circleX : CGFloat = 25
    @State var showCircle : Bool = false
    @State var PlayerPoints : Int = 0
    @State var now = Date()
    var body: some View {
        VStack{
            Text("Player points: " + String(PlayerPoints)).foregroundColor(.cyan).font(.title3)
            Text ("Time : ").foregroundColor(.cyan).font(.title3) + Text (now, style: .timer).foregroundColor(.cyan).font(.title3)
            ZStack(alignment: .bottom) {
                    
                    Rectangle()
                        .fill(.blue)
                
                
                Image(systemName:"airport.extreme.tower")
                    .font(.largeTitle)
                    .offset(x: CannonX)
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
                    CannonX -= 15
                    
                }label: {
                    Image(systemName: "arrowshape.turn.up.backward")
                        .foregroundColor(.primary)
                }
                .keyboardShortcut("a",modifiers: [])
                VStack{
                    Button("Attack"){
                        circleY = -30
                        circleX = CannonX
                        showCircle = true
                        withAnimation(.easeIn(duration: 0.5)) { 
                            circleY = -670
                        }
                        if  circleX-25<coinX && coinX<circleX+25{
                            PlayerPoints += 2
                            withAnimation(.linear(duration: 0.1).delay(0.5)) { 
                                showCoin = false
                                coinX = CGFloat(Int.random(in: -200...200))
                            }
                        }else{
                            PlayerPoints -= 5
                        }
                        withAnimation(.linear(duration: 0.1).delay(0.5)) { 
                            showCircle = false
                        }
                        withAnimation(.linear(duration: 0.1).delay(1)) { 
                            showCoin = true
                        }
                    }
                    Button("Start Game"){
                        PlayerPoints = 0
                        coinX = 0
                        now = Date()
                    }.padding()
                }
                Button{
                    CannonX += 15
                }label: {
                    Image(systemName: "arrowshape.turn.up.right")
                        .foregroundColor(.primary)
                }
                .keyboardShortcut("d",modifiers: [])
                
            }
        }
    }
}
