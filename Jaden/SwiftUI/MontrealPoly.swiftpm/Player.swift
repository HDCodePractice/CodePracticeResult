import SwiftUI

struct Player{
    var players : [[Int]] = [[10,10],[10,10],[10,10],[10,10]]
    
    var lands : [[Int]] = [
        [1,0,-1],[2,0,-1],[3,0,-1]
    
    ]
    
    @State var landColors : [[Color]] = [
        [.clear,.clear,.clear,.clear,.clear,.clear,.clear,.clear,.clear,.clear,.clear],
        [.clear,.clear,.clear,.clear,.clear,.clear,.clear,.clear,.clear,.clear,.clear],
        [.clear,.clear,.clear,.clear,.clear,.clear,.clear,.clear,.clear,.clear,.clear],
        [.clear,.clear,.clear,.clear,.clear,.clear,.clear,.clear,.clear,.clear,.clear]
    ]
    
    var playerColors : [Color] = [.red, .blue, .green, .yellow]
    var nextPlayer = 0
    
    func getLandColor(x: Int, y: Int)->Color{
        print(x,y)
        if x != 0 && y == 10 && landColors[0][x] == .clear{
            print("xxx")
            return .gray
            if x == 0 && y != 10 && landColors[1][y] == .clear{
                print("fff")
                return .blue
                if x != 10 && y == 10 && landColors[3][x] == .clear{
                    print("yyy")
                    return .red
                    if x == 10 && y != 0 && landColors[2][y] == .clear{
                        print("iii")
                        return .yellow
                    }
                }
            }
            
        }
        return .clear
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
    }

}
