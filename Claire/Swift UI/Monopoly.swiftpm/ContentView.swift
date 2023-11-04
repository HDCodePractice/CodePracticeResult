import SwiftUI

struct ContentView: View {
    @State var corners : [String] = ["Go","Visiting Jail","Free Parking","Go To Jail"]
    
    @State var bought : [[String]] = [
        []
    
    
    ]
    
    @State var colors : [[Color]] = [
        [.clear,.blue,.blue,.clear,.blue,.green,.clear,.red,.clear,.clear,.clear],
        [.clear,.red,.blue,.clear,.blue,.green,.clear,.red,.clear,.clear,.clear],
        [.clear,.red,.blue,.clear,.blue,.green,.clear,.red,.clear,.clear,.clear],
        [.clear,.red,.blue,.clear,.blue,.green,.clear,.red,.clear,.clear,.clear]
    ]
    
    @State var lands = [
        ["","Jaden","Jaden","Jaden","4","Claire","6","Claire","8","Claire",""],
        ["","1","2","3","4","5","6","7","8","9",""],
        ["","1","2","3","4","5","6","7","8","9",""],
        ["","1","2","3","4","5","6","7","8","9",""]
    ]
    
    @State var players : [[Int]] = [[10,10],[10,10],[10,10],[10,10]]
    @State var playerColors : [Color] = [.red, .blue, .green, .yellow]
    
    
    
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
                                    .fill(isClear(x: x, y: y) ? .white : .cyan)
                                    .overlay{
                                        if !isClear(x: x, y: y){
                                            Rectangle()
                                                .stroke(.black,lineWidth: 2)
                                        }
                                    }
                                VStack{
                                    Text(getText(x: x, y: y))
                                    Text("\(x),\(y)")
                                        .foregroundColor(.black)
                                }
                                VStack{
                                    HStack{
                                        Circle()
                                            .fill(getPlayerColor(x: x, y: y, player: 0))
                                            .frame(width: 20)
                                        Circle()
                                            .fill(getPlayerColor(x: x, y: y, player: 1))
                                            .frame(width: 20)
                                        
                                    }
                                    HStack{
                                        Circle()
                                            .fill(getPlayerColor(x: x, y: y, player: 2))
                                            .frame(width: 20)
                                        
                                        Circle()
                                            .fill(getPlayerColor(x: x, y: y, player: 3))
                                            .frame(width: 20)
                                    }
                                }
                                if !isClear(x: x, y: y){
                                    VStack{
                                        Rectangle()
                                            .fill(getColor(x: x, y: y))
                                        Rectangle()
                                            .fill(.clear)
                                        Rectangle()
                                            .fill(.clear)
                                        Rectangle()
                                            .fill(.clear)
                                        Rectangle()
                                            .fill(.clear)
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
                            players[0][0] -= 2
                        }
                    }
                Text("\(dice)")
                    .foregroundColor(.black)
            }
        }
        .padding()
    }
    
    func getPlayerColor(x:Int,y:Int,player:Int)->Color{
        if players[player][0]==x && players[player][1]==y{
            return playerColors[player]
        }
        return .clear
    }
    
    func getColor(x: Int,y:Int)->Color{
        if y==0{
            return colors[0][x]
        }
        if x==0 {
            return colors[1][y]
        }
        if x==10{
            return colors[2][y]
        }
        if y==10{
            return colors[3][x]
        }
        return .clear
    }
    
    func getText(x: Int,y:Int)->String{
        if x==10 && y==10{
            return corners[0]
        }
        if x==0 && y==10{
            return corners[1]
        }
        if x==0 && y==0{
            return corners[2]
        }
        if x==10 && y==0{
            return corners[3]
        }
        if y==0{
            return lands[0][x]
        }
        if x==0 {
            return lands[1][y]
        }
        if x==10{
            return lands[2][y]
        }
        if y==10{
            return lands[3][x]
        }
        return ""
    }
    
    func isClear(x: Int, y: Int)->Bool{
        if x==0 || y==0 || x==10 || y==10{
            return false
        }
        return true
    }
}
