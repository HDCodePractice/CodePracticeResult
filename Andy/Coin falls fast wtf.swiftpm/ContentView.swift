import SwiftUI

struct ContentView: View {
    @State var coinX : CGFloat = 0
    @State var carX : CGFloat = 0
    @State var showBullet = false
    @State var bulletX : CGFloat = 0
    @State var hitBullet = false
    @State var align : Alignment = .bottom
    @State var shotsFired : Int = 0
    @State var coinsHit : Int = 0
    @State var totalScore : Int = 0
    @State var shotsMissed : Int = 0
    var body: some View {
        VStack{
            VStack{
                Text("Total score: \(totalScore)")
                HStack{
                    Text("Shots fired:  \(shotsFired)     ")
                        .font(.title3)
                    Text("Shots missed:  \(shotsMissed)     ")
                        .font(.title3)
                    Text("Coins hit:  \(coinsHit)")
                        .font(.title3)
                }
            }
            ZStack(alignment: .bottom) {
                Rectangle()
                    .fill(.blue)
                Image(systemName:"cablecar")
                    .font(.largeTitle)
                    .offset(x: carX)
                ZStack(alignment: .top){
                    Color.clear
                    Image(systemName: "bitcoinsign.circle")
                        .font(.largeTitle)
                        .offset(x: coinX)
                        .foregroundColor(hitBullet ? .clear : .white)
                }
                ZStack(alignment: align){
                    Color.clear
                    Image(systemName: "airport.extreme.tower")
                        .font(.largeTitle)
                        .offset(x: bulletX)
                        .foregroundColor(showBullet ?  .white : .clear)
                }
            }
            .frame(width:450,height:700)
            
            HStack{
                Button{
                    carX -= 22.5
                }label: {
                    Image(systemName: "arrowtriangle.left")
                        .foregroundColor(.primary)
                }.buttonStyle(.bordered)
                Button{
                    carX -= 12.5
                }label: {
                    Image(systemName: "arrowtriangle.left.fill")
                        .foregroundColor(.primary)
                }.buttonStyle(.bordered)
                Button{
                    carX -= 5
                }label: {
                    Image(systemName: "arrowtriangle.left.circle")
                        .foregroundColor(.primary)
                }.buttonStyle(.bordered)
                Button("☭☭☭☭☭☭"){
                    hitBullet = false
                    showBullet = true
                    bulletX = carX
                    align = .bottom
                    withAnimation(.linear(duration: 1)){
                        align = .top
                    }
                    withAnimation(.linear(duration: 0.5).delay(1)){
                        if bulletX-coinX > -26&&bulletX-coinX<26{
                            hitBullet=true
                            withAnimation(.linear(duration: 0.001).delay(2)){
                                coinsHit += 1
                                coinX = CGFloat.random(in:-200...200)
                                totalScore += 2
                                shotsFired+=1
                            } 
                        }else{
                            withAnimation(.linear(duration: 0.001).delay(2)){
                                shotsFired+=1
                                shotsMissed += 1
                                totalScore -= 5
                            }
                        }
                    }
                    withAnimation(.linear(duration: 0.001).delay(1)){
                        showBullet = false
                    }
                    withAnimation(.linear(duration: 0.001).delay(2)){
                        hitBullet=false
                    }
                }.buttonStyle(.bordered)
                .keyboardShortcut(.space , modifiers: [])
                Button{
                    carX += 5
                }label: {
                    Image(systemName: "arrowtriangle.right.circle")
                        .foregroundColor(.primary)
                }.buttonStyle(.bordered)
                Button{
                    carX += 12.5
                }label: {
                    Image(systemName: "arrowtriangle.right.fill")
                        .foregroundColor(.primary)
                }.buttonStyle(.bordered)
                Button{
                    carX += 22.5
                }label: {
                    Image(systemName: "arrowtriangle.right")
                        .foregroundColor(.primary)
                }.buttonStyle(.bordered)
            }
        }
    }
}
