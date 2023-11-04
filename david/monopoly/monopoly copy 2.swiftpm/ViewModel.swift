import SwiftUI

struct ViewModel{
    var  lands:[[Land]] = []
    var chessLocation:[[String]]=[]
    var x = 0
    var  y = 10
    
    init(){
        emptyChess()
        print(chessLocation[y][x])
        
        print(chessLocation[10][0])
    }
    
    mutating func emptyChess(){
        for y in 0..<11{
            var line:[String]=[]
            for x in 0..<11{
                line.append("\(x),\(y)")
            }
            chessLocation.append(line)
        }
    }
    
}

