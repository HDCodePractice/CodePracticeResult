import SwiftUI
struct Game{ 
    var board:[[Grid]] = []
    var gridStatus = GridState.empty
    let width = 10
    let hight = 10
    let boats = [Boat.A,Boat.B,Boat.C,Boat.C,Boat.D]
    var boat = Boat.A
    let bullet = Bullet.Small
    
    init(){
        startGame()
    }
    
    mutating func startGame(){
        board = []
        for i in 0..<hight{
            var row:[Grid] = []
            for j in 0..<width{
                row.append(Grid(gridState: gridStatus, boat: boat, h: i, w: j))
            }
            board.append(row)
        }
        inputBoats()
    }
    
    mutating func inputBoats(){
        
        for i in boats{
            var flag = true
            while flag{
                let directions = (0...1).randomElement()!
                if directions == 0{
                    
                    let hY = (0..<board.count).randomElement()!
                    let wX = (0..<board[0].count-i.boatNumber()).randomElement()!
                    
                    if isEmpty(grid: board[hY][wX], directions: directions, boat:i){
                        for w in wX..<wX+i.boatNumber(){
                            board[hY][w] = Grid(gridState:GridState.hideBoat, boat: i, h: hY, w: w)
                        }
                        flag = false
                    } 
                    
                }else{
                    let wX = (0..<board[0].count).randomElement()!
                    let hY = (0..<board.count-i.boatNumber()).randomElement()!
                    if isEmpty(grid: board[hY][wX], directions: directions, boat: i){
                        for h in hY..<hY+i.boatNumber(){
                            
                            board[h][wX] = Grid(gridState:GridState.hideBoat, boat: i, h: h, w: wX)
                        }
                        flag = false
                    }
                }
            }
        }
    }
    
    
    mutating func isEmpty(
        grid:Grid,
        directions:Int,
        boat:Boat
    )->Bool{
        let h = grid.h
        let w = grid.w
        
        if directions == 0{
            for w1 in w..<w+boat.boatNumber(){
                if board[h][w1].gridState.getFile() != "empty"{
                    return false
                }
            }
        }else{
            for h1 in h..<h+boat.boatNumber(){
                
                if board[h1][w].gridState.getFile() != "empty"{
                    return false
                }
            }
        }
        return true
    }
}
