import SwiftUI

struct NineBoard{
    
    var nineBoard:[[Grid]] = []
    var r: Int
    var c: Int
    
    let column = 3
    let row = 3
    
//    init(){
//        startGame()
//    }
    
    mutating func startGame(){
        nineBoard = []
        for i in 0..<row{
            var rows:[Grid]=[]
            for j in 0..<column{
                rows.append(Grid(x: i, y: j))
            }
            nineBoard.append(rows)
        }
        
        
    }
    
    
}
