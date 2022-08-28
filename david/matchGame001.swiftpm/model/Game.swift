import SwiftUI

struct Game{
    var board:[[Grid]]=[]
    let width = 5
    let hight = 4
    var picsArray:[String]=["basket","figure.wave","bolt.car","tram.fill.tunnel","figure.run","fleuron.fill","bandage.fill","camera.aperture","camera.filters","playstation.logo"]
    
    init(){
        startGame()
    }
    
    mutating func startGame(){
        board = []
        for i in 0..<hight{
            var row:[Grid]=[]
            for j in 0..<width{Grid(pics: "aaa", x: i, y: j)
            }
            board.append(row)
        }
    }
}

