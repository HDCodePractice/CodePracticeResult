import SwiftUI

struct ContentView: View {
    @State var fallY : CGFloat = -700
    @State var tru = false
    @State var offsetCar : CGFloat = 0
    @State var fallX : CGFloat = 0
    @State var start = false
    var body: some View {
        VStack{
            if (fallX-offsetCar) > -30 && (fallX-offsetCar) < 30{
                Text("true")
            }
            ZStack(alignment: .bottom) {
                Rectangle()
                    .fill(.blue)
                Image(systemName:"cart")
                    .font(.largeTitle)
                    .offset(x: offsetCar)
            }.frame(width:450,height:700)
            ZStack(){
                Image(systemName: "dollarsign.circle")
                    .offset(x: fallX, y: fallY)
                    .foregroundColor(tru ? .white : .clear)
            }
            Button("Start"){
                start = true
                fallY = -700
                tru = true
                fallX = CGFloat.random(in: -225...225)
                    var a = 2.5
                    withAnimation(.linear(duration: 2.5)){
                        fallY = -40
                    }
                    withAnimation(.linear(duration:0.5).delay(2.5)){
                        tru = false
                    }
                    a += 8
            }
            HStack{
                Button{
                    withAnimation{
                        offsetCar -= 20
                    }
                }label: {
                    Image(systemName: "arrowtriangle.left.fill")
                        .font(.title)
                }
                Divider()
                Divider()
                Divider()
                Button{
                    withAnimation{
                        offsetCar += 20
                    }
                }label: {
                    Image(systemName: "arrowtriangle.right.fill")
                        .font(.title)
                }
                
            }
        }
    }
}
