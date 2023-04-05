import SwiftUI

struct GameView: View {
    @State var squirrelX : CGFloat = 0
    @State var squirrelY : CGFloat = 0
    @State var dogX : CGFloat = 0
    @State var boneY : CGFloat = -30
    @State var boneX : CGFloat = 0
    @State var check  = false
    @State var hit = true
    @State var shots = 0
    @State var score = 0
    @State var time = 10
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var timeCheck = false
    func genPosition(){
        squirrelX = CGFloat.random(in: -200..<200)
        squirrelY = 0
    }
    var body: some View {
        VStack{
            HStack{
                Text("Bones Thrown: \(shots)")
                Text("Squirrels Hit: \(score)")
                Text("Time: \(time) Seconds")
                    .onReceive(timer) { _ in
                        if timeCheck == true {
                            time += 1
                        }else{
                            time = 0
                        }
                    }
            }
            ZStack(alignment: .bottom) {
                Rectangle()
                    .fill(.blue)
                Image("bone")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .offset(x: boneX, y: boneY)
                    .foregroundColor(check ? .white : .clear)
                Image("dog")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .offset(x: dogX)
                ZStack(alignment: .top){
                    Color.clear
                    Image("squirrel")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .offset(x: squirrelX, y: squirrelY)
                        .foregroundColor(hit ? .white : .clear)
                }
            }
            .frame(width:450,height:700)
            .onAppear{
                genPosition()
            }
            
            HStack{
                Button{
                    timeCheck = true
                    withAnimation(.easeInOut){
                        dogX -= 10
                    }
                    
                }label: {
                    Image(systemName: "arrowshape.turn.up.backward")
                        .foregroundColor(.primary)
                }
                .keyboardShortcut("a",modifiers: [])
                VStack{
                    Button("Attack"){
                        timeCheck = true
                        check = true
                        shots += 1
                        boneX = dogX
                        withAnimation(.easeInOut(duration: 0.5)){
                            boneY = -670
                            
                        }
                        withAnimation(.easeInOut(duration: 0.5).delay(0.7)){
                            if boneX >= squirrelX - 35 && boneX <= squirrelX + 35{
                                hit = false 
                                score += 2
                            }else{
                                score -= 1
                            }
                        }
                        withAnimation(.easeInOut(duration: 0.0001).delay(1.2)){
                            check = false
                            boneY = -30
                            if hit == false{
                                genPosition()
                            }
                            hit = true
                        }
                    }.keyboardShortcut(.space, modifiers: [])
                    Button("Restart Game"){
                        genPosition()
                        dogX = 0
                        boneY = -30
                        boneX = 0
                        check  = false
                        hit = true
                        shots = 0
                        score = 0
                        timeCheck = false
                    }
                }
                
                
                Button{
                    timeCheck = true
                    withAnimation(.easeInOut){
                        dogX += 10
                    }
                }label: {
                    Image(systemName: "arrowshape.turn.up.right")
                        .foregroundColor(.primary)
                }
                .keyboardShortcut("d",modifiers: [])
                
            }
        }
    }
}

struct Game_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
