import SwiftUI
struct Game{ 
    var board:[[Grid]] = []
    var gridStatus = 0
    let width = 10
    let hight = 10
    let ships = [Ship.A,Ship.B,Ship.C,Ship.C,Ship.D]
    var ship = Ship.Z
    let bullet = Bullet.Small
    var counts = 0    
    init(){
        startGame()
    }
    
    mutating func startGame(){
        board = []
        counts = 0
        for i in 0..<hight{
            var row:[Grid] = []
            for j in 0..<width{
                row.append(Grid( ship: ship, h: i, w: j))
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
                            board[hY][w] = Grid(ship: i, h: hY, w: w)
                        }

                        flag = false
                    } 
                    
                }else{
                    let wX = (0..<board[0].count).randomElement()!
                    let hY = (0..<board.count-i.shipNumber()).randomElement()!
                    if isEmpty(grid: board[hY][wX], directions: directions, ship: i){
                        for h in hY..<hY+i.shipNumber(){
                            
                            board[h][wX] = Grid(ship: i, h: h, w: wX)
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
                if board[h][w1].ship.shipStatus() != "empty"{
                    return false
                }
            }
        }else{
            for h1 in h..<h+ship.shipNumber(){
                
                if board[h1][w].ship.shipStatus() != "empty"{
                    return false
                }
            }
        }
        return true
    }
    
    mutating func tapGrid(grid:Grid){
        let w = grid.w
        let h = grid.h
        
        if grid.ship.shipStatus() != "empty"{
            counts += 1
            board[h][w] = Grid(ship: Ship.H, h:h, w:w)
        }else{
            board[h][w] = Grid(ship: Ship.Hitted, h: h, w: w)
        }
        
    }
    
    mutating func isOver()->Bool{ 
        if counts >= 17{
            
            return true
        }
        return false
    }
    
}
