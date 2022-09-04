import SwiftUI
import Foundation

struct Game{
    var board:[[Grid]] = []
    var showBoard:[[Grid]] = []
    var tempBoard:[[Grid]] = []
    var counts = 0
    var preX:Int = -1
    var preY:Int = -1
    //    var preGrid :Grid
    let width = 5
    let hight = 4 
    let picsOriginal:[String] = [
        "cloud.sleet","person.3","externaldrive.badge.wifi","tram.fill.tunnel","trash.circle",
        "aqi.high","gamecontroller","camera.aperture","camera.filters","bolt.horizontal"]
    
    init(){
        startGame()
    }
    
    mutating func startGame(){
        board = []
        var picsArray = (picsOriginal+picsOriginal).shuffled()
        
        for i in 0..<hight{
            var row:[Grid]=[]
            for j in 0..<width{
                row.append(Grid(pics: "timelapse", x: i, y: j))
            }
            board.append(row)
        }
        showBoard = board
        tempBoard = showBoard
        for x in 0..<board.count{
            for y in 0..<board[x].count{
                board[x][y] = Grid(pics: picsArray.first!, x:x , y: y)
                picsArray.removeFirst()
            }
        }
    }
    
    mutating func showPics(grid:Grid){
        let x = grid.x
        let y = grid.y
        
        print(showBoard[x][y].pics)
        if showBoard[x][y].pics=="timelapse"{
            counts = (counts==0 ? 1:2)
        }
        if showBoard[x][y].pics != ""{
            showBoard[x][y] = board[x][y]
        }
        
        if counts==2{
            if grid.x != showBoard[preX][preY].x || grid.y != showBoard[preX][preY].y{
                if grid.pics == showBoard[preX][preY].pics {
                    showBoard[x][y].pics = ""
                    showBoard[preX][preY].pics = ""
                    tempBoard = showBoard
                }else{
                    
//                    sleep(1)
                        
                        
                    
                    
                }
                showBoard = tempBoard
                
            }
            
            counts = 0
        }
        preX = x
        preY = y
    }
    
    
    mutating func isSame(grid1:Grid,grid2:Grid)->Bool{
        
        if grid1.pics == grid2.pics{
            showBoard[grid1.x][grid1.y] = Grid(pics: "", x: grid1.x, y: grid1.y)
            showBoard[grid2.x][grid2.y] = Grid(pics: "", x: grid2.x, y: grid2.y)
            tempBoard = showBoard
            
            return true
        }
        showBoard = tempBoard
        return false
    }
}


