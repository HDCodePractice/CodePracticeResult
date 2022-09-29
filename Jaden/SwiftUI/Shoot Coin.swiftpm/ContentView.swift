import SwiftUI

struct ContentView: View {
    @State var coinX : CGFloat = 0
    @State var carX : CGFloat = 0
    @State var bulletY : CGFloat = -30
    @State var bulletX : CGFloat = 0
    @State var check  = false
    @State var hit = true
    var body: some View {
        VStack{
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
                        .offset(x: coinX)
                        .foregroundColor(hit ? .white : .clear)
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
                    check = true
                    bulletX = carX
                    withAnimation(.easeInOut(duration: 1.0)){
                        bulletY = -670
                        
                    }
                    withAnimation(.easeInOut(duration: 0.5).delay(0.7)){
                        if bulletX >= coinX - 35 && bulletX <= coinX + 35{
                            hit = false 
                        }
                    }
                    withAnimation(.easeInOut(duration: 0.0001).delay(1.2)){
                        check = false
                        bulletY = -30
                        hit = true
                    }
                }.keyboardShortcut(.space, modifiers: [])
                
                Button{
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
