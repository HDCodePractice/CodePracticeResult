import SwiftUI

struct ViewModel{
    var board : [[Grid]] = []
    
    init(){
        let lastChess = ["Rook", "Bishop", "Knight", "Queen", "King", "Knight", "Bishop", "Rook"]
        var lineChess : [Grid] = []
        board = []
        for index in 0..<lastChess.count{
            lineChess.append( Grid(x: 0, y: index, color: index%2==0 ? .white : .black , token: Token(name: lastChess[index], color: .gray)))
        }
        func genrateLine(x:Int)->[Grid]{
            var line : [Grid] = []
            if x > 1 && x < 6{
                if x%2==0{
                    for i in 0...7{
                        line.append(Grid(x: x, y: i, color: i%2==0 ? .white : .black , token: Token(name: "", color: .clear)))
                    }
                }else{
                    for i in 0...7{
                        line.append(Grid(x: x, y: i, color: i%2==1 ? .white : .black , token: Token(name: "", color: .clear)))
                    }
                }
            }else if x == 0{
                for i in 0...7{
                    line.append( Grid(x: x, y: i, color: i%2==0 ? .white : .black , token: Token(name: lastChess[i], color: .black)))
                }
            }else if x == 7{
                for i in 0...7{
                    line.append( Grid(x: x, y: i, color: i%2==1 ? .white : .black , token: Token(name: lastChess[i], color: .white)))
                }
            }else{
                if x == 1{
                    for i in 0...7{
                        line.append( Grid(x: x, y: i, color: i%2==1 ? .white : .black , token: Token(name: "Pawn", color: .black)))
                    }
                }else{
                    for i in 0...7{
                        line.append( Grid(x: x, y: i, color: i%2==0 ? .white : .black , token: Token(name: "Pawn", color: .white)))
                    }
                }
            }
            return line
        }
        for j in 0..<8{
            board.append(genrateLine(x: j))
        }
    }
}
