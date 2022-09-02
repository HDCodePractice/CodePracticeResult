import SwiftUI

struct Grid : Identifiable,Hashable{
    var id = UUID()
    var x : Int
    var y : Int
    var ships : Int 
}

struct ContentView: View {
    let width = 10
    let height = 10
    let shipsNumber = 10
    let shipColors : [Color] = [.clear,.red,.gray,.blue,.cyan,.green,.mint,.yellow,.indigo,.orange,.brown]
    
    @State var board : [[Grid]] = []
    
    func startGame(){
        board = []
        for i in 0..<height{
            var row : [Grid] = []
            for j in 0..<width{
                row.append(Grid(x: i, y: j, ships: 0))
            }
            board.append(row)
        }
    }
    func buildShips() -> [[[Int]]]{
        let startNumber = 2
        var shipCount = startNumber
        ships = []
        
        for _ in 1...shipsNumber{
            // H
            if [0,1].randomElement()==0{
                var startX : Int = Int.random(in: 0...width-shipCount)
                var startY : Int = Int.random(in: 0...height-1)
                var ship : [[Int]] = [[startX,startY]]
                for _ in 1...shipCount{
                    startX += 1
                    ship.append([startX,startY])
                }
                ships.append(ship)
            }else{ // V
                var startX : Int = Int.random(in: 0...width-shipCount)
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
                            if  piece.shipPiece == shipsNumber{
                                piece.shipPiece = 1
                            }else{
                                piece.shipPiece += 1
                            }
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
