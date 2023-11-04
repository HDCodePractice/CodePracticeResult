import SwiftUI

struct ContentView: View {
    @State var fallY : CGFloat = -700
    @State var tru = true
    var body: some View {
        VStack{
            ZStack(alignment: .bottom) {
                Rectangle()
                    .fill(.blue)
                Image(systemName:"cart")
                    .font(.largeTitle)
            }.frame(width:450,height:700)
            ZStack(){
                Image(systemName: "dollarsign.circle")
                    .font(.largeTitle)
                    .offset(y: fallY)
                    .foregroundColor(tru ? .white : .clear)
            }
            HStack{
                Button(""){
                    
                }label: {
                    Image(systemName: "arrowshape.turn.up.backward")
                        .foregroundColor(.primary)
                }.buttonStyle(.bordered)
                
                Button("Attack"){
                    fallY = -700
                    tru = true
                    withAnimation(.linear(duration: 1)){
                        fallY = -25
                    }
                    withAnimation(.linear(duration: 0.0001).delay(1)){
                        tru = false
                    }
                }
                
                Button(){
                    
                }label: {
                    Image(systemName: "arrowshape.turn.up.right")
                        .foregroundColor(.primary)
                }.buttonStyle(.bordered)
            }
        }
    }
}
