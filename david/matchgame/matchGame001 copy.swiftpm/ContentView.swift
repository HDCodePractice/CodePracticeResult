
import SwiftUI

struct Game{
    //    var picsArray:[String]=["basket","figure.wave","bolt.car","tram.fill.tunnel","figure.run","fleuron.fill","bandage.fill","camera.aperture","camera.filters","playstation.logo"]
    var board : [[Grid]] = []
    let width = 5
    let hight = 4
    
    init(){
        startGame()
    }
    
    mutating func startGame(){
        board = []
        for i in 0..<hight{
            var row:[Grid]=[] 
            for j in 0..<width{
                row.append(Grid(pics:"OOO", x: i, y: j))
                
            }
            board.append(row)
        }
    }
}

////var board = game.
//let xxx = Game()
//var board = xxx.board
//
////print(board)

