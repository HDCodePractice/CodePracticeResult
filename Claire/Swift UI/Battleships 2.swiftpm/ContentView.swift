import SwiftUI

struct Grid : Identifiable,Hashable{
    var id = UUID()
    var x : Int
    var y : Int
    var shipPiece : Int
    //-1: clicked nothing 0: not clicked 1/2/3/4/5/6/7/8/9/10 piece of #? ship
}

struct ContentView: View {
    let width = 10
    let height = 10
    let shipsNumber = 5
    let shipColors : [Color] = [.clear, .red, .green, .blue, .gray, .mint, .yellow, .orange, .indigo, .cyan, .purple, .pink, .brown]
    @State var ships : [[[Int]]] = [[[0,0],[0,1]],[[1,1],[2,1],[3,1]],[[5,0],[5,1],[5,2],[5,3],[5,4],[5,5]]]
    @State var playerTurn = false
    @State var p1Score = 0
    @State var p2Score = 0
    // false -> player 1's turn
    // true -> player 2's turn
    
    @State var board : [[Grid]] = [
        [Grid(x: 0, y: 0, shipPiece: 0),Grid(x: 0, y: 1, shipPiece: 0)],
        [Grid(x: 1, y: 0, shipPiece: 0),Grid(x: 1, y: 1, shipPiece: 0)]
    ]
    
    @State var shipPlace : [[Grid]] = [
        [Grid(x: 0, y: 0, shipPiece: 0),Grid(x: 0, y: 1, shipPiece: 0), Grid(x: 0, y: 2, shipPiece: 0), Grid(x: 0, y: 3, shipPiece: 0), Grid(x: 0, y: 4, shipPiece: 0)],
        [Grid(x: 1, y: 0, shipPiece: 0),Grid(x: 1, y: 1, shipPiece: 0)]
    ]
    
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
        return ships
    }
    
    
    var body: some View {
        HStack{
            Spacer()
            Text("\(p1Score)")
                .font(.custom("Gill Sans", size: 40))
                .foregroundColor(.red)
            Spacer()
            if playerTurn == false {
                Text("Player 1's Turn")
                    .font(.custom("Gill Sans", size: 20))
                    .foregroundColor(.white)
            } else {
                Text("Player 2's Turn")
                    .font(.custom("Gill Sans", size: 20))
                    .foregroundColor(.white)
            }
            Spacer()
            Text("\(p2Score)")
                .font(.custom("Gill Sans", size: 40))
                .foregroundColor(.blue)
            Spacer()
        }
        .padding()
        VStack{
            ForEach(board,id:\.self){ row in
                HStack{
                    ForEach(row){ grid in
                        ZStack{
                            Rectangle()
                                .fill(.black)
                            RoundedRectangle(cornerRadius: 20)
                                .fill(shipColors[grid.shipPiece])
                                .padding(2)
                        }
                        .onTapGesture {
                            var piece = grid
                            if piece.shipPiece == shipsNumber{
                                piece.shipPiece = 1
                            }else{
                                piece.shipPiece += 1
                            }
                            board[grid.x][grid.y] = piece
                            if playerTurn == false{
                                p1Score += 1
                            } else {
                                p2Score += 1
                            }
                            playerTurn.toggle()
                        }
                    }
                }
            }
        }
        .padding()
        .onAppear{
            startGame()
        }
    }
}
