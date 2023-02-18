import SwiftUI

struct Game{
    var board:[Grid]=[]
    var globeSize:Image.Scale = .large
    let z = 10
    
    init(){
        
        startGame()
        globeSize = .large
    }
    
    mutating func startGame(){
        board = []
        
        for _ in 0..<z{
            board.append(Grid(globe: "globe", x: 0, y: 0))
        }
        
    }
    
    mutating func switchSize()->Image.Scale{
        
        if globeSize == .large{
            globeSize = .small
        }else{
            globeSize = .large
        }
        return globeSize
    }
    
    mutating func playGame(){
        
        for i in 0..<board.count{
            board[i].x = Double.random(in: -185...185)
            board[i].y = Double.random(in: -285...290)
            
            board[i].switchColor()
        }
    }
}

struct Grid{
    var globe:String
    var x:Double
    var y:Double
    var backColor:getColor = .white
    var globeColor:getColor = .black
    
    mutating func switchColor(){
        if backColor == .white {
            backColor = .blue
            globeColor = .yellow
        }
        
        let tempColor = backColor
        backColor = globeColor
        globeColor = tempColor
    }
}

enum getColor{
    case black
    case white
    case blue
    case yellow
    
    var color : Color{
        switch self{
        case .black:
            return .black
        case .white:
            return .white
        case .blue:
            return .blue
        case .yellow:
            return .yellow
            
        }
    }
}
