import SwiftUI

let facingPlace : [String] = ["H", "V"]
var randomX = Int.random(in: 0...9)
var randomY = Int.random(in: 0...9)
var facing = facingPlace.randomElement()
var boatLength = [2,3,4,5,6]
var currentBoatLength = 2
struct Grid : Identifiable,Hashable{
    var id = UUID()
    var x : Int
    var y : Int
    var shipPiece : Int
}
var usedColors : [Int] = []
var currentColor : Int = Int.random(in: 1...9)
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
                row.append(Grid(x: i, y: j, shipPiece: 0))
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
//                            if  piece.shipPiece == shipsNumber{
//                                piece.shipPiece = 0
//                            }else{
//                                piece.shipPiece += 1
//                            }
                            board[grid.x][grid.y]=piece
                        }
                    }
                }
            }
        }
        .padding()
        .onAppear { 
            startGame()
            func GenBoat(){
                    randomX = Int.random(in: 0...9)
                    randomY = Int.random(in: 0...9)
                    facing = facingPlace.randomElement()
                    if board[randomX][randomY].shipPiece == -1{
                        if facing == "H"{
                            if randomX + currentBoatLength < 10{
                                currentColor = Int.random(in: 0...9)
                                while !(usedColors.contains(currentColor)){
                                    currentColor = Int.random(in: 0...9)
                                }
                                usedColors.append(currentColor)
                                for i in 1...currentBoatLength{ // doing the X
                                    Grid(x: randomX + i, y: randomY, shipPiece: currentColor)
                                }
                                currentBoatLength += 1
                            }else{
                                GenBoat()
                            }
                        }else{
                            if randomY + currentBoatLength < 10{
                                currentColor = Int.random(in: 0...9)
                                while !(usedColors.contains(currentColor)){
                                    currentColor = Int.random(in: 0...9)
                                }
                                usedColors.append(currentColor)
                                for i in 1...currentBoatLength{ // doing the Y
                                    Grid(x: randomX, y: randomY + i, shipPiece: currentColor)
                                }
                                currentBoatLength += 1
                            }else{
                                GenBoat()
                            }
                        }
                }
            }
            GenBoat()
            print(board)
            print(currentColor)
        }
    }
}
