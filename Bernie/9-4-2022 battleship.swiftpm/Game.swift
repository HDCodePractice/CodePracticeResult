import SwiftUI

struct Game{
    var board: [[Grid]] = []
    var width = 10
    var height = 10
    var boatLength = [2,3,3,4,5]
    var boatColor : [Color] = [.blue,.orange,.red,.purple,.green]
    var clickCount = 0
    var boatCoordinates = [[Int]]()
    var allBoatsCoordinates = [[[Int]]]()
    
    init(){
        startGame()
    }
    
    mutating func genBoard(){
        for i in 0..<height{
            var row : [Grid] = []
            for j in 0..<width{
                row.append(Grid(symbol: Symbol.square , x: i, y: j,gridColor: .mint))
            }
            board.append(row)
        }
    }
    
    mutating func genBoat(boatLength: Int){
        boatCoordinates = []
        let isVertical = Bool.random()
        if isVertical {
            let x = Int.random(in: 0..<board.count-1)
            var y = Int.random(in: 0..<board[0].count-boatLength)
            for _ in 1...boatLength{
                boatCoordinates.append([x,y])
                y += 1
            }
        } else {
            var x = Int.random(in: 0..<board.count-boatLength)
            let y = Int.random(in: 0..<board[0].count-1)
            for _ in 1...boatLength{
                boatCoordinates.append([x,y])
                x += 1
            }
        }
    }
    
    func isOverlapping(allBoatsCoordinates:[[[Int]]],boat:[[Int]])->Bool{
        for i in allBoatsCoordinates{
            for j in boat{
                if i.contains(j)  {
                    return true
                }
            }
        }
        return false
    }
    
    mutating func dropBoats(){
        for i in 0..<allBoatsCoordinates.count{
            for j in allBoatsCoordinates[i]{
                let x = j[1]
                let y = j[0]
                board[x][y].symbol = Symbol.boat
                board[x][y].gridColor = boatColor[i]
            }
        }
    }
    
    mutating func tapGrid(grid: Grid){
        
    }
    
    mutating func startGame(){
        genBoard()
        for i in 0..<boatLength.count{
            while allBoatsCoordinates.count == i{
                genBoat(boatLength: boatLength[i])
                if isOverlapping(allBoatsCoordinates: allBoatsCoordinates, boat:boatCoordinates){
                    allBoatsCoordinates.append(boatCoordinates)
                    
                }
            }
        }
        dropBoats()
    }
}


