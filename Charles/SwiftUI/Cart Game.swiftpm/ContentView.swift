import SwiftUI

struct ContentView: View {
    @State var fallY : CGFloat = -700
    @State var tru = true
    @State var a : CGFloat = 0
    @State var b : [CGFloat] = [-190, 0, 190]
    @State var c = Int.random(in: 0..<2)
    @State var d = 0
    var body: some View {
        VStack{
            Text("Score:\(d)")
                .font(.largeTitle)
            ZStack{
                Rectangle()
                    .fill(.blue)
                Image(systemName:"cart")
                    .font(.largeTitle)
                    .offset(x: a, y: 330)
            }.frame(width:450,height:700)
            ZStack(){
                Image(systemName: "dollarsign.circle")
                    .font(.largeTitle)
                    .offset(x: b[c], y: fallY)
                    .foregroundColor(tru ? .black: .clear)
            }
            HStack{
                Button{
                    a = a - 190
                    if a == b[c]{
                        d+=1
                    }
                }label: {
                    Image(systemName: "arrowshape.turn.up.backward")
                        .foregroundColor(.primary)
                }.buttonStyle(.bordered)
                Button("Drop"){
                    
                    fallY = -700
                    tru = true
                    b.shuffle()
                    withAnimation(.linear(duration: 1)){
                        fallY = -25
                    }
                    withAnimation(.linear(duration: 0.0001).delay(1)){
                        tru = false
                    }
                    if a == b[c]{
                        d+=1
                    }
                }
                Button{
                    a = a + 190
                    if a == b[c]{
                        d+=1
                    }
                }label: {
                    Image(systemName: "arrowshape.turn.up.right")
                        .foregroundColor(.primary)
                }.buttonStyle(.bordered)
            }
        }
    }
}
