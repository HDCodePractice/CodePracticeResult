import SwiftUI

struct Game{
    var nineBoard:[[Int]] = []
    let column = 3
    let row = 3
    
    init(){
        startGame()
    }
    
    mutating func startGame(){
        nineBoard = []
        for _ in 0..<row{
            var rows:[Int]=[]
            for _ in 0..<column{
                rows.append(0)
            }
            nineBoard.append(rows)
        }
        
    }
}
