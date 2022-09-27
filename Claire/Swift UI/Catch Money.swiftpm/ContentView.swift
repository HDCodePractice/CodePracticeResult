import SwiftUI

struct ContentView: View {
    @State var fallY : CGFloat = -700
    @State var randomX : CGFloat = CGFloat.random(in: -150...150)
    @State var moveX : CGFloat = 0
    @State var score = 0
    @State var tru = true
    var body: some View {
        VStack{
            Text("Score: \(score)")
            ZStack(alignment: .bottom) {
                Rectangle()
                    .fill(.blue)
                Image(systemName:"cart")
                    .font(.largeTitle)
                    .offset(x: moveX)
            }.frame(width:450,height:700)
            ZStack(){
                Image(systemName: "dollarsign.circle")
                    .font(.largeTitle)
                    .offset(x: randomX, y: fallY)
                    .foregroundColor(tru ? .white : .clear)
            }
            HStack{
                Button{
                    moveX -= 5
                }label: {
                    Image(systemName: "arrowshape.turn.up.backward")
                        .foregroundColor(.primary)
                }.buttonStyle(.bordered)
                
                Button("Start"){
                    fallY = -700
                    tru = true
                    withAnimation(.linear(duration: 1)){
                        fallY = -25
                    }
                    withAnimation(.linear(duration: 0.0001).delay(1)){
                        tru = false
                    }
                }
                
                Button{
                    moveX += 5
                }label: {
                    Image(systemName: "arrowshape.turn.up.right")
                        .foregroundColor(.primary)
                }.buttonStyle(.bordered)
            } 
        }
    }
}
