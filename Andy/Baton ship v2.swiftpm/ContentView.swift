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
    let shipsNumber = 10
    let shipColors : [Color] = [.clear,.red,.gray,.blue,.cyan,.green,.mint,.yellow,.indigo,.orange,.brown]
    
    @State var board : [[Grid]] = []
    
    func startGame(){
        var dir = Int.random(in:1...2)
        var boat = 2
        if dir == 1{
            var x1 = Int.random(in:0...width)
            var y1 = Int.random(in:0...height-boat)
        }else{
            var y1 = Int.random(in:0...width)
            var x1 = Int.random(in:0...height-boat)
        }
        board = []
        for i in 0..<height{
            var row : [Grid] = []
            for j in 0..<width{
                row.append(Grid(x: i, y: j, shipPiece: 0))
                if dir == 2 && j >= y1 || dir == 2 && j <= y1 {
                    row[i][j] = (Grid(x: i, y: j, shipPiece: boat))
                    boat +=1
                    var dir = Int.random(in:1...2)
                    if dir == 1{
                        var x1 = Int.random(in:0...width)
                        var y1 = Int.random(in:0...height-boat)
                    }else{
                        var y1 = Int.random(in:0...width)
                        var x1 = Int.random(in:0...height-boat)
                    }
                }
            }
            if dir == 1 && j >= y1 || dir == 1 && j<= y1 {
                row[i][j] = (Grid(x: i, y: j, shipPiece: boat))
                boat += 1
                        var dir = Int.random(in:1...2)
                if dir == 1{
                    var x1 = Int.random(in:0...width)
                    var y1 = Int.random(in:0...height-boat)
                }else{
                    var y1 = Int.random(in:0...width)
                    var x1 = Int.random(in:0...height-boat)
                }
            }
            board.append(row)
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
