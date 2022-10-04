import SwiftUI

struct ContentView: View {
    @State var alignUno : [Alignment] = [.topLeading,.topLeading,.center,.center,.bottomTrailing,.bottomTrailing]
    @State var alignDuo : [Alignment] = [.center,.center,.center,.center,.center,.center]
    @State var alignTrio : [Alignment] = [.center,.center,.center,.center,.center,.center]
    @State var uno = 1
    @State var Duo = 1
    @State var Trio = 1
    @State var rotate = 0
    @State var totalPoints = ""
    @State var isRunning = false
    var body: some View {
        VStack{
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.red)
                    .frame(width:150,height:150)
                    .rotationEffect(Angle(degrees: Double(rotate)))
                    .offset(x: 100,y:100)
                ForEach(0...5,id:\.self){ i in
                    ZStack(alignment: alignUno[i]){
                        Rectangle()
                            .fill(.clear)
                            .frame(width:125,height:125)
                        Circle()
                            .fill(.white)
                            .frame(width:25,height:25)
                    }
                }
                .frame(width:150,height:150)
                .rotationEffect(Angle(degrees: Double(rotate)))
                .offset(x: 100,y:100)
                RoundedRectangle(cornerRadius: 20)
                    .fill(.red)
                    .frame(width:150,height:150)
                    .rotationEffect(Angle(degrees: Double(rotate)))
                    .offset(x: -100,y:100)
                ForEach(0...5,id:\.self){ i in
                    ZStack(alignment: alignDuo[i]){
                        Rectangle()
                            .fill(.clear)
                            .frame(width:125,height:125)
                        Circle()
                            .fill(.white)
                            .frame(width:25,height:25)
                    }
                }
                .frame(width:150,height:150)
                .rotationEffect(Angle(degrees: Double(rotate)))
                .offset(x: -100,y:100)
                RoundedRectangle(cornerRadius: 20)
                    .fill(.red)
                    .frame(width:150,height:150)
                    .rotationEffect(Angle(degrees: Double(rotate)))
                    .offset(x: 00,y:-100)
                ForEach(0...5,id:\.self){ i in
                    ZStack(alignment: alignTrio[i]){
                        Rectangle()
                            .fill(.clear)
                            .frame(width:125,height:125)
                        Circle()
                            .fill(.white)
                            .frame(width:25,height:25)
                    }
                }
                .frame(width:150,height:150)
                .rotationEffect(Angle(degrees: Double(rotate)))
                .offset(x: 00,y:-100)
            }
            if isRunning{
                Text("Filiping")
                    .offset(y:150)
                    .font(.title2)
            }else{
                Text(totalPoints)
                    .offset(y:150)
                    .font(.title2)
            }
            Button("Randomise"){
                rotate = 0
                withAnimation(.linear(duration: 0.1)){
                    isRunning = true
                }
                withAnimation(.linear(duration: 1.5)){
                    rotate = 360
                    totalPoints = "calculating"
                    uno = Int.random(in:1...6)
                    Duo = Int.random(in:1...6)
                    Trio = Int.random(in:1...6)
                    if uno==1{
                        alignUno=[.center,.center,.center,.center,.center,.center]
                    }
                    else if uno==2{
                        alignUno=[.topLeading,.topLeading,.topLeading,.bottomTrailing,.bottomTrailing,.bottomTrailing]
                    }
                    else if uno==3{
                        alignUno=[.topLeading,.topLeading,.center,.center,.bottomTrailing,.bottomTrailing]
                    }
                    else if uno==4{
                        alignUno=[.topLeading,.topLeading,.bottomLeading,.topTrailing,.bottomTrailing,.bottomTrailing]
                    }
                    else if uno==5{
                        alignUno=[.topLeading,.center,.bottomLeading,.topTrailing,.center,.bottomTrailing]
                    }
                    else if uno==6{
                        alignUno=[.topLeading,.leading,.bottomLeading,.topTrailing,.trailing,.bottomTrailing]
                    }
                    if uno==1{
                        alignDuo=[.center,.center,.center,.center,.center,.center]
                    }
                    else if Duo==2{
                        alignDuo=[.topLeading,.topLeading,.topLeading,.bottomTrailing,.bottomTrailing,.bottomTrailing]
                    }
                    else if Duo==3{
                        alignDuo=[.topLeading,.topLeading,.center,.center,.bottomTrailing,.bottomTrailing]
                    }
                    else if Duo==4{
                        alignDuo=[.topLeading,.topLeading,.bottomLeading,.topTrailing,.bottomTrailing,.bottomTrailing]
                    }
                    else if Duo==5{
                        alignDuo=[.topLeading,.center,.bottomLeading,.topTrailing,.center,.bottomTrailing]
                    }
                    else if Duo==6{
                        alignDuo=[.topLeading,.leading,.bottomLeading,.topTrailing,.trailing,.bottomTrailing]
                    }
                    if uno==1{
                        alignTrio=[.center,.center,.center,.center,.center,.center]
                    }
                    else if Trio==2{
                        alignTrio=[.topLeading,.topLeading,.topLeading,.bottomTrailing,.bottomTrailing,.bottomTrailing]
                    }
                    else if Trio==3{
                        alignTrio=[.topLeading,.topLeading,.center,.center,.bottomTrailing,.bottomTrailing]
                    }
                    else if Trio==4{
                        alignTrio=[.topLeading,.topLeading,.bottomLeading,.topTrailing,.bottomTrailing,.bottomTrailing]
                    }
                    else if Trio==5{
                        alignTrio=[.topLeading,.center,.bottomLeading,.topTrailing,.center,.bottomTrailing]
                    }
                    else if Trio==6{
                        alignTrio=[.topLeading,.leading,.bottomLeading,.topTrailing,.trailing,.bottomTrailing]
                    }
                }
                withAnimation(.linear(duration: 0.1).delay(1.2)){
                    isRunning = false
                    totalPoints = String(uno+Duo+Trio)
                }
            }
            .offset(y:200)
        }
    }
}
