import SwiftUI

struct ContentView: View {
    @State var degrees = 0.0
    @State var toggle = false
    @State var headTail = ["head","tail"]
    @State var image:String = "head"
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .scaledToFit()
                .mask{
                    Circle()
                        .frame(width: 300, height: 300)
                }
                .rotation3DEffect(Angle(degrees: degrees),axis:(x:1,y:0,z:0))
            Image("tail")
                .resizable()
                .scaledToFit()
                .rotation3DEffect(Angle(degrees: 3),axis:(x:1,y:0,z:0))
            
            Text("\(degrees)")
            Slider(value:$degrees, in:0...720)
            Button("Start"){
                withAnimation(
                    .easeInOut(duration: 1.0)
                    .speed(1.00)){
                        degrees = (toggle ? 360.0:0.0)
//                        toggle = ((toggle.toggle()) ? false : true)
                        toggle.toggle()
                        
                        image = headTail.randomElement()!
                    }
                    
                
            }
            .buttonStyle(.borderedProminent)
        }
//        .ba, <#() throws -> Void#>, <#() throws -> Void#>ckground(.red)
        .padding()
    }
}
