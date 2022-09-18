import SwiftUI
struct Game{ 
    var board:[[Grid]] = []
    var gridStatus = GridStatus.empty
    let width = 10
    let hight = 10
    var counts = 0 
    let ships = [Ship.A,Ship.B,Ship.C,Ship.C,Ship.D]
    
    init(){
        startGame()
    }
    
    mutating func startGame(){
        board = []
        for i in 0..<hight{
            var row:[Grid] = []
            for j in 0..<width{
                row.append(Grid( gridStatus: gridStatus, h: i, w: j))
            }
            board.append(row)
        }
        inputBoats()
    }
    
    
    mutating func inputBoats(){
        
        for i in ships{
            var flag = true
            while flag{
                let directions = (0...1).randomElement()!
                if directions == 0{
                    
                    let hY = (0..<board.count).randomElement()!
                    let wX = (0..<board[0].count-i.shipNumber()).randomElement()!
                    
                    if isEmpty(grid: board[hY][wX], directions: directions, ship:i){
                        for w in wX..<wX+i.shipNumber(){
                            board[hY][w] = Grid(gridStatus: GridStatus.hideShip, ship: i, h: hY, w: w)
                        }

                        flag = false
                    } 
                    
                }else{
                    let wX = (0..<board[0].count).randomElement()!
                    let hY = (0..<board.count-i.shipNumber()).randomElement()!
                    if isEmpty(grid: board[hY][wX], directions: directions, ship: i){
                        for h in hY..<hY+i.shipNumber(){
                            
                            board[h][wX] = Grid(gridStatus: GridStatus.hideShip, ship: i, h: h, w: wX)
                        }
//                        gridStatus = 1
                        flag = false
                    }
                }
            }
        }
    }
    
    mutating func isEmpty(
        grid:Grid,
        directions:Int,
        ship:Ship
    )->Bool{
        let h = grid.h
        let w = grid.w
        
        if directions == 0{
            for w1 in w..<w+ship.shipNumber(){
                if board[h][w1].gridStatus.getFile() != "empty"{
                    return false
                }
            }
        }else{
            for h1 in h..<h+ship.shipNumber(){
                
                if board[h1][w].gridStatus.getFile() != "empty"{
                    return false
                }
            }
        }
        return true
    }
    mutating func tapGrid(grid:Grid){
        let h = grid.h
        let w = grid.w
        
        if grid.gridStatus.getFile() != "empty" {
            board[h][w] = Grid(gridStatus: GridStatus.destroiedShip, ship: grid.ship, h: h, w: w)
            counts += 1
            
        }else{
            board[h][w] = Grid(gridStatus: GridStatus.attactted, ship: grid.ship, h: grid.h, w: w)
        }
        
    }
    
    mutating func isOver()->Bool{ 
        if counts >= 17{
            counts = 0
            return true
        }
        return false
    }
    
}
