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
    @State var playernumber = 0
    @State var shipsNumber = 5
    let shipColors : [Color] = [.clear,.red,.gray,.blue,.cyan,.green,.mint,.yellow,.indigo,.orange,.brown]
    @State var ships : [[[Int]]] = [[[0,0],[0,1]],[[1,1],[2,1],[3,1]],[[5,0],[5,1],[5,2],[5,3],[5,4],[5,5]]]
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
    func checkTap(grid:Grid)->Int {
        for i in 0..<ships.count{
            if ships[i].contains([grid.x,grid.y]) {
                return i+1
            }
        }
        return 0
    }
    func buildShips() -> [[[Int]]]{
        let startNumber = 2
        var shipCount = startNumber
        ships = []
        
        for _ in 1...shipsNumber-1{
            var usedIndex : [Int] = []
            // H
            if [0,1].randomElement()==0{
                var startX : Int = Int.random(in: 0...width-shipCount)
                var startY : Int = Int.random(in: 0...height-1)
                var ship : [[Int]] = [[startX,startY]]
                for _ in 1...shipCount-1{
                    startX += 1
                    ship.append([startX,startY])
                }
                ships.append(ship)
            }else{ // V
                var startX : Int = Int.random(in: 0...width-1)
                
                var startY : Int = Int.random(in: 0...height-shipCount)
                var ship : [[Int]] = [[startX,startY]]
                for _ in 1...shipCount-1{
                    startY += 1
                    ship.append([startX,startY])
                }
                ships.append(ship)
            }
            shipCount += 1
        }
        return ships
    }
    var body: some View {
        VStack{
            if playernumber%2==0{
                Text("Player A's move")
            }else{
                Text("Player B's move")
            }
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
                            playernumber+=1
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
