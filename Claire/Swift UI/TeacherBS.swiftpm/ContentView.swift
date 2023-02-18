import SwiftUI

struct Grid : Identifiable,Hashable{
    var id = UUID()
    var x : Int
    var y : Int
    var shipPiece : Int // -1: clicked Nothing 0:not clicked 1/2/3/4/5/6/7/8/9/10 第N条ship的piece
}

struct ContentView: View {
    let width = 10
    let height = 10
    let shipsNumber = 5
    let shipColors : [Color] = [.clear,.red,.blue,.cyan,.green,.mint,.yellow,.indigo,.orange,.brown]
    @State var ships : [[[Int]]] = [
        [[0,0],[0,1]],
        [[1,1],[2,1],[3,1]]
    ]
    
    @State var board : [[Grid]] = []
    
    func startGame(){
        board = []
        for i in 0..<height{
            var row : [Grid] = []
            for j in 0..<width{
                row.append(Grid(x: i, y: j, shipPiece: 0))
            }
            board.append(row)
        }
        ships = buildShips()
    }
    
    func buildShips() -> [[[Int]]]{
        let startNumber = 2
        var shipCount = startNumber
        ships = []
        
        for _ in 1...shipsNumber{
            // H
            if [0,1].randomElement()==0{
                var startX : Int = Int.random(in: 0...width-shipCount)
                let startY : Int = Int.random(in: 0...height-1)
                var ship : [[Int]] = [[startX,startY]]
                for _ in 1...shipCount{
                    startX += 1
                    ship.append([startX,startY])
                }
                ships.append(ship)
            }else{ // V
                let startX : Int = Int.random(in: 0...width-shipCount)
                var startY : Int = Int.random(in: 0...height-1)
                var ship : [[Int]] = [[startX,startY]]
                for _ in 1...shipCount{
                    startY += 1
                    ship.append([startX,startY])
                }
                ships.append(ship)
            }
            shipCount += 1
        }
        return ships
    }
    
    // Check grid , return shipColors Index
    func checkTap(grid: Grid)->Int{
        for i in 0..<ships.count{
            if ships[i].contains([grid.x,grid.y]){
                return i+1
            }
        }
        return 0
    }
    
    var body: some View {
        VStack{
            ForEach(board,id:\.self){ row in
                HStack{
                    ForEach(row){ grid in
                        ZStack{
                            Rectangle()
                            RoundedRectangle(cornerRadius: 10)
                                .fill(shipColors[grid.shipPiece])
                                .padding(2)
                        }
                        .onTapGesture {
                            var piece = grid
                            piece.shipPiece = checkTap(grid: grid)
                            board[grid.x][grid.y]=piece
                        }
                    }
                }
            }
        }
        .padding()
        .onAppear { 
            startGame()
        }
    }
}
