import SwiftUI

struct ContentView: View {
    @State var degrees = 0.0
    let array = ["head", "tail","head", "tail", "tail", "tail"]
    @State var pic = "head"
    var body: some View {
        VStack {
            
            Image("\(pic)")
                .resizable()
                .scaledToFit()
                .mask { 
                    Circle()
                    
                }
                .rotation3DEffect(Angle(degrees: degrees), axis: (x:0 , y: 1, z: 0))
            Text(pic)
//            Slider(value: $degrees, in: 0...720)
            Button("Start"){
                withAnimation(.easeInOut(duration: 1.00)
                    .speed(1.00)
                    .delay(0.00)){
//                if degrees != 0.0{
//                    degrees = 0.0
//                }else{
//                    degrees = 360
//                }
                        degrees = degrees == 0.00 ?  720 :  0.00
                        pic = array.randomElement() ?? "head"
                }
            }.buttonStyle(.borderedProminent)
        }
        
        .padding()
    }
}
