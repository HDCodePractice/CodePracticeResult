import SwiftUI

struct player{
    var players : [[Int]] = [[10,10],[10,10],[10,10],[10,10]]
    var playerColors : [Color] = [.mint,.purple,.orange,.brown]
    var playerTurn : Int = 0
    func circleColor(x:Int,y:Int)->[Color]{
        var players1 : [Color] = []
        for i in 0...3{
            if players[i][0]==x && players[i][1]==y{
                players1.append(playerColors[i])
            }else{
                players1.append(.clear)
            }
        }
        return players1
    }
    mutating func movePlayer(amount: Int){
        movePlayers(position: players[playerTurn], amount: amount)
        playerTurn += 1
        if playerTurn == players.count{
            playerTurn = 0
        }
    }
    mutating func movePlayers(position:[Int],amount:Int){
        var pos : [Int] = position
        for _ in 1...amount{
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
        players[playerTurn]=pos
    }
}
