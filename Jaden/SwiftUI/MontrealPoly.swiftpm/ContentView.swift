import SwiftUI

struct ContentView: View {
    @State var corners : [String] = ["Go","Visiting Jail","Free Parking","Go To Jail"]
    
    @State var colors : [[Color]] = [
        [.clear,.red,.clear,.red,.red,.clear,.yellow,.yellow,.clear,.yellow,.clear],
        [.clear,.orange,.orange,.clear,.orange,.clear,.purple,.purple,.clear,.purple,.clear],
        [.clear,.green,.green,.clear,.green,.clear,.clear,.blue,.clear,.blue,.clear],
        [.clear,.cyan,.cyan,.clear,.cyan,.clear,.clear,.brown,.clear,.brown,.clear]
    ]
    
    @State var lands = [
        ["","Kentucky Avenue","Chance","Indiana Avenue","Illinois Avenue","B. & O. Railroad","Atlantic Avenue","Ventor Avenue","Water Works","Marvin Gardens",""],
        ["","New York","Tennesse Avenue","Community Chest","St.James Place","Pennsylvania Road","Virginia Avenue","States Avenue","Electric Company","St. Charles Place",""],
        ["","Pacific Avenue","North Carolina Avenue","Community Chest","Pennsylvania Avenue","Short Line","Chance","Park Place","Luxury","Tax",""],
        ["","Conneticut Avenue","Vermont Avenue","Chance","Oriental Avenue","Reading Railroad","Income Tax","Baltic Avenue","Community Chest","Mediterranean Avenue",""]
    ]
    
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
                                    Text(getText(x: x, y: y))
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
                                            .fill(getColor(x: x, y: y))
                                        Rectangle()
                                            .fill(.clear)
                                        Rectangle()
                                            .fill(.clear)
                                        Rectangle()
                                            .fill(.clear)
                                        Rectangle()
                                            .fill(buyColor(x: x, y: y))
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
                          
                            if b == 0{
                                if player.getLandColor(x: player.players[b][0], y: player.players[b][1])  != .clear{
                                    print(player.getLandColor(x: player.players[b][0], y: player.players[b][1]),"hiii")
                                    if player.getLandColor(x: player.players[b][0], y: player.players[b][1]) == .gray{
                                        print("bref")
                                        print(player.landColors[0][player.players[b][0]],player.playerColors[b])
                                        player.landColors[0][player.players[b][0]] = player.playerColors[b]
                                        print(player.landColors[0][player.players[b][0]],player.playerColors[b])
                                    }else if player.getLandColor(x: player.players[b][0], y: player.players[b][1])  == .blue{
                                        player.landColors[1][player.players[b][1]] = player.playerColors[b]

                                    }else if player.getLandColor(x: player.players[b][0], y: player.players[b][1])  == .red{
                                        player.landColors[2][player.players[b][0]] = player.playerColors[b]

                                    }else if player.getLandColor(x: player.players[b][0], y: player.players[b][1])  == .yellow{
                                        player.landColors[3][player.players[b][1]] = player.playerColors[b]

                                    }
                                }
                                
                                b = 1
                            }else if b == 1{
                                print(player.getLandColor(x: player.players[b][0], y: player.players[b][1]),"hiii")
                                if player.getLandColor(x: player.players[b][0], y: player.players[b][1])  != .clear{
                                    if player.getLandColor(x: player.players[b][0], y: player.players[b][1])  == .gray{
                                        player.landColors[0][player.players[b][0]] = player.playerColors[b]
                                    }else if player.getLandColor(x: player.players[b][0], y: player.players[b][1])  == .blue{
                                        player.landColors[1][player.players[b][1]] = player.playerColors[b]
                                        
                                    }else if player.getLandColor(x: player.players[b][0], y: player.players[b][1])  == .red{
                                        player.landColors[2][player.players[b][0]] = player.playerColors[b]
                                        
                                    }else if player.getLandColor(x: player.players[b][0], y: player.players[b][1])  == .yellow{
                                        player.landColors[3][player.players[b][1]] = player.playerColors[b]
                                        
                                    }                                }
                                b = 2
                            }else if b == 2{
                                print(player.getLandColor(x: player.players[b][0], y: player.players[b][1]),"hiii")
                                if player.getLandColor(x: player.players[b][0], y: player.players[b][1]) != .clear{
                                    if player.getLandColor(x: player.players[b][0], y: player.players[b][1])  == .gray{
                                        player.landColors[0][player.players[b][0]] = player.playerColors[b]
                                    }else if player.getLandColor(x: player.players[b][0], y: player.players[b][1])  == .blue{
                                        player.landColors[1][player.players[b][1]] = player.playerColors[b]
                                        
                                    }else if player.getLandColor(x: player.players[b][0], y: player.players[b][1])  == .red{
                                        player.landColors[2][player.players[b][0]] = player.playerColors[b]
                                        
                                    }else if player.getLandColor(x: player.players[b][0], y: player.players[b][1])  == .yellow{
                                        player.landColors[3][player.players[b][1]] = player.playerColors[b]
                                        
                                    }
                                }
                                b = 3
                            }else if b == 3{
                                print(player.getLandColor(x: player.players[b][0], y: player.players[b][1]),"hiii")
                                if player.getLandColor(x: player.players[b][0], y: player.players[b][1])  != .clear{
                                    if player.getLandColor(x: player.players[b][0], y: player.players[b][1])  == .gray{
                                        player.landColors[0][player.players[b][0]] = player.playerColors[b]
                                    }else if player.getLandColor(x: player.players[b][0], y: player.players[b][1])  == .blue{
                                        player.landColors[1][player.players[b][1]] = player.playerColors[b]
                                        
                                    }else if player.getLandColor(x: player.players[b][0], y: player.players[b][1])  == .red{
                                        player.landColors[2][player.players[b][0]] = player.playerColors[b]
                                        
                                    }else if player.getLandColor(x: player.players[b][0], y: player.players[b][1])  == .yellow{
                                        player.landColors[3][player.players[b][1]] = player.playerColors[b]
                                        
                                    }
                                }
                                b = 0
                            }
                            
                        }
                    }
                Text("\(dice)")
                    .foregroundColor(.black)
            }
        }
        .padding()
    }
    
    
    func buyColor(x: Int,y:Int)->Color{
        if y==0{
            return player.landColors[0][x]
        }
        if x==0 {
            return player.landColors[1][y]
        }
        if x==10{
            return player.landColors[2][y]
        }
        if y==10{
            return player.landColors[3][x]
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

