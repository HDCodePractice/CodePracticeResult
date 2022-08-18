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
    @State var b = 0
    let shipColors : [Color] = [.clear,.red,.gray,.blue,.cyan,.green,.mint,.yellow,.indigo,.orange,.brown]
    @State var ship : [Grid] = []
    @State var board : [[Grid]] = []
    func players()->Int{
        if b == 0{
            b = 1
            return 1
            
        }else{
            b = 0
            return 0
        }
    }
    func startGame(){
        board = []
        for i in 0..<height{
            var row : [Grid] = []
            for j in 0..<width{
                row.append(Grid(x: i, y: j, shipPiece: 0))
                
            }
            board.append(row)
            
        }
    }
    func shipMaker(shipLength: Int){
        ship = []
        var a = Int.random(in: 0...1)
        if a == 0 {
            var shipX = Int.random(in:0...width-shipLength)
            var shipY = Int.random(in:0...height)
            for i in 0...shipLength-1{
                ship.append(Grid(x: shipX, y: shipY + i, shipPiece: 20))
            }
            print(ship)
        }else{
            
        }
            
    }

    var body: some View {
        VStack{
            if players() == 1{
                Text("Player one is clicking")
                    .font(.largeTitle)
            }else{
                Text("Player two is clicking")
                    .font(.largeTitle)
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
                            players()
                            var piece = grid
                            for i in 0...board.count-1{
                                for j in 0...ship.count-1{
                                    if board[i][i].x == ship[j].x && board[i][i].y == ship[j].y{
                                        piece.shipPiece = 4
                                    }
                                }
                            }
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
            shipMaker(shipLength: 5)

        }
    }
}
