import SwiftUI

struct ContentView: View {
    
    @State var player : Player = Player()
    
    @State var a = 0
    @State var b = 0
    
    @State var dice : Int = 1
    @State var turn : Bool = false
    
    var body: some View {
        
        ZStack{
            VStack(spacing: 0) {
                ForEach(0..<11){ y in
                    HStack(spacing: 0) {
                        ForEach(0..<11){ x in
                            ZStack{
                                Rectangle()
                                    .fill(isClear(x: x, y: y) ? .white : .gray)
                                    .overlay{
                                        if !isClear(x: x, y: y){
                                            Rectangle()
                                                .stroke(.black,lineWidth: 2)
                                        }
                                    }
                                VStack{
                                    Text(player.getText(x: x, y: y))
                                }
                                VStack{
                                    HStack{
                                        Circle()
                                            .fill(player.getPlayerColor(x: x, y: y, player: 0))
                                            .frame(width: 20)
                                        Circle()
                                            .fill(player.getPlayerColor(x: x, y: y, player: 1))
                                            .frame(width: 20)
                                        
                                    }
                                    HStack{
                                        Circle()
                                            .fill(player.getPlayerColor(x: x, y: y, player: 2))
                                            .frame(width: 20)
                                        
                                        Circle()
                                            .fill(player.getPlayerColor(x: x, y: y, player: 3))
                                            .frame(width: 20)
                                    }
                                }
                                if !isClear(x: x, y: y){
                                    VStack{
                                        Rectangle()
                                            .fill(player.getColor(x: x, y: y))
                                        Rectangle()
                                            .fill(.clear)
                                        Rectangle()
                                            .fill(.clear)
                                        Rectangle()
                                            .fill(.clear)
                                        Rectangle()
                                            .fill(player.getOwnerColor(x: x, y: y))
                                    }
                                }
                            }
                        }
                    }
                }
            }
            VStack{
                Dice(dice: $dice, turn: $turn)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.5)){
                            dice = Int.random(in: 1...6)
                            turn.toggle()
                            
                            player.movePlayer(step: dice)
                          
                            
                        }
                    }
                Text("\(dice)")
                    .foregroundColor(.black)
            }
        }
        .padding()
    }
    
    
   
    
    func isClear(x: Int, y: Int)->Bool{
        if x==0 || y==0 || x==10 || y==10{
            return false
        }
        return true
    }
}

