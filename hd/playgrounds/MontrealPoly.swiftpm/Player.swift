import SwiftUI

struct Player{
    var players : [[Int]] = [[10,10],[10,10],[10,10],[10,10]]
    var playerColors : [Color] = [.red, .blue, .green, .yellow]
    var nextPlayer = 0
    
    func getPlayerColor(x:Int,y:Int,player:Int)->Color{
        if players[player][0]==x && players[player][1]==y{
            return playerColors[player]
        }
        return .clear
    }
    
    mutating func movePlayer(step:Int){
        movePlayer(player: nextPlayer, step: step)
        nextPlayer += 1
        if nextPlayer == players.count{
            nextPlayer = 0
        }
    }
    
    mutating func movePlayer(player:Int,step:Int){
        var pos = players[player]
        for _ in 1...step{
            // left
            if pos[0]==0 && pos[1]>0{
                pos[1]-=1
                // right
            }else if pos[0]==10 && pos[1]<10{
                pos[1]+=1
                // top
            }else if pos[1]==0 && pos[0] < 10{
                pos[0]+=1
                // buttom
            }else if pos[1]==10 && pos[0]>0{
                pos[0]-=1
                // corner
            }else{
                if pos[0]==pos[1]{
                    // 0,0
                    if pos[0]==0{
                        pos[0]+=1
                        // 10,10
                    }else{
                        pos[0]-=1
                    }
                }else{
                    // 0,10
                    if pos[0]==0{
                        pos[1]-=1
                        // 10,0
                    }else{
                        pos[1]+=1
                    }
                }
            }
        }
        players[player]=pos
    }
}
