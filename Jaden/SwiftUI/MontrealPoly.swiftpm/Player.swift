import SwiftUI

struct Player{
    var players : [[Int]] = [[10,10],[10,10],[10,10],[10,10]]
    
   
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
        ["","Pacific Avenue","North Carolina Avenue","Community Chest","Pennsylvania Avenue","Short Line","Chance","Park Place","Luxury Tax","BoardWalk",""],
        ["","Conneticut Avenue","Vermont Avenue","Chance","Oriental Avenue","Reading Railroad","Income Tax","Baltic Avenue","Community Chest","Mediterranean Avenue",""]
    ]
    
    var owners : [[Color]] = [
        [.gray,.clear,.clear,.clear,.clear,.clear,.clear,.clear,.clear,.clear,.gray],
        [.gray,.clear,.clear,.clear,.clear,.clear,.clear,.clear,.clear,.clear,.gray],
        [.gray,.clear,.clear,.clear,.clear,.clear,.clear,.clear,.clear,.clear,.gray],
        [.gray,.clear,.clear,.clear,.clear,.clear,.clear,.clear,.clear,.clear,.gray]
    ]
    
    var playerColors : [Color] = [.red, .blue, .green, .yellow]
    var nextPlayer = 0
    
    func getOwnerColor(x: Int,y:Int)->Color{
        if y==0{
            return owners[0][x]
        }
        if x==0 {
            return owners[1][y]
        }
        if x==10{
            return owners[2][y]
        }
        if y==10{
            return owners[3][x]
        }
        return .clear
    }
    
    mutating func setOwnerToPLayer(player: Int, pos:[Int]){
        let x = pos[0]
        let y = pos[1]
        if y == 0{
            if owners[0][x] == .clear{
               owners[0][x] = playerColors[player] 
            }
            
        }
        if x == 0{
            if owners[1][y] == .clear{
                 owners[1][y] = playerColors[player]
            }
           
        }
        if x == 10{
            if owners[2][y] == .clear{
                owners[2][y] = playerColors[player]
            }
            
        }
        if y == 10{
            if owners[3][x] == .clear{
                owners[3][x] = playerColors[player]
            }
            
        }
        
        
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
            
    
    func getPlayerColor(x:Int,y:Int,player:Int)->Color{
        if players[player][0]==x && players[player][1]==y{
            return playerColors[player]
        }
        return .clear
    }
    
    mutating func movePlayer(step: Int){
        movePlayer(player: nextPlayer, amount: step)
        nextPlayer += 1
        if nextPlayer == players.count{
            nextPlayer = 0
        }
    }
    
    
    mutating func movePlayer(player: Int,amount:Int){
        var pos = players[player]
        for i in 1...amount{
            if pos[0]==0 && pos[1]>0{
                pos[1]-=1
            }else if pos[0]==10 && pos[1]<10{
                pos[1]+=1
            }else if pos[1]==0 && pos[0] < 10{
                pos[0]+=1
            }else if pos[1]==10 && pos[0]>0{
                pos[0]-=1
            }else{
                if pos[0]==pos[1]{
                    if pos[0]==0{
                        pos[0]+=1
                    }else{
                        pos[0]-=1
                    }
                }else{
                    if pos[0]==0{
                        pos[1]-=1
                    }else{
                        pos[1]+=1
                    }
                }
            }
        }
       players[player] = pos
        setOwnerToPLayer(player: player, pos: pos)
    }
    
    
    

}
