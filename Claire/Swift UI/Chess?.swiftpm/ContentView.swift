import SwiftUI

struct ContentView: View {
    var board : [[Color]] = [
        [.white, .white, .white, .white, .white, .white, .white, .white, .white, .white],
        [.white, .white, .black, .white, .black, .white, .black, .white, .black, .white],
        [.white, .black, .white, .black, .white, .black, .white, .black, .white, .white],
        [.white, .white, .black, .white, .black, .white, .black, .white, .black, .white],
        [.white, .black, .white, .black, .white, .black, .white, .black, .white, .white],
        [.white, .white, .black, .white, .black, .white, .black, .white, .black, .white],
        [.white, .black, .white, .black, .white, .black, .white, .black, .white, .white],
        [.white, .white, .black, .white, .black, .white, .black, .white, .black, .white],
        [.white, .black, .white, .black, .white, .black, .white, .black, .white, .white],
        [.white, .white, .white, .white, .white, .white, .white, .white, .white, .white]
    ]
    
    var chessPosition : [[String]] = [
        ["", "A", "B", "C", "D", "E", "F", "G", "H", ""],
        ["8", "BRook", "BKnight", "BBishop", "BQueen", "BKing", "BBishop", "BKnight", "BRook", "8"],
        ["7", "BPawn", "BPawn", "BPawn", "BPawn", "BPawn", "BPawn", "BPawn", "BPawn", "7"],
        ["6", "", "", "", "", "", "", "", "", "6"],
        ["5", "", "", "", "", "", "", "", "", "5"],
        ["4", "", "", "", "", "", "", "", "", "4"],
        ["3", "", "", "", "", "", "", "", "", "3"],
        ["2", "WPawn", "WPawn", "WPawn", "WPawn", "WPawn", "WPawn", "WPawn", "WPawn", "2"],
        ["1", "WRook", "WKnight", "WBishop", "WQueen", "WKing", "WBishop", "WKnight", "WRook", "1"],
        ["", "A", "B", "C", "D", "E", "F", "G", "H", ""]
    ]
    var body: some View {
        VStack(spacing:0) {
            ForEach(0..<8,id:\.self){ x in
                HStack(spacing:0){
                    ForEach(0..<8,id:\.self){ y in
                        ZStack{
                            if chessPosition[x][y] == "A"{
                                Text("A")
                            } else if chessPosition[x][y] == "B"{
                                Text("B")
                            } else if chessPosition[x][y] == "C"{
                                Text("C")
                            } else if chessPosition[x][y] == "D"{
                                Text("D")
                            } else if chessPosition[x][y] == "E"{
                                Text("E")
                            } else if chessPosition[x][y] == "F"{
                                Text("F")
                            } else if chessPosition[x][y] == "G"{
                                Text("G")
                            } else if chessPosition[x][y] == "H"{
                                Text("H")
                            } else if chessPosition[x][y] == "1"{
                                Text("1")
                            } else if chessPosition[x][y] == "2"{
                                Text("2")
                            } else if chessPosition[x][y] == "3"{
                                Text("3")
                            } else if chessPosition[x][y] == "4"{
                                Text("4")
                            } else if chessPosition[x][y] == "5"{
                                Text("5")
                            } else if chessPosition[x][y] == "6"{
                                Text("6")
                            } else if chessPosition[x][y] == "7"{
                                Text("7")
                            } else if chessPosition[x][y] == "8"{
                                Text("8")
                            } else if chessPosition[x][y] == "BRook" || chessPosition[x][y] == "WRook"{
                                Text("Rook")
                            } else if chessPosition[x][y] == "BPawn" || chessPosition[x][y] == "WPawn"{
                                Text("Pawn")
                            } else if chessPosition[x][y] == "Knight" || chessPosition[x][y] == "WRook"{
                                Text("Rook")
                            }
                            Rectangle()
                                .fill(board[x][y])
                        }
                    }
                }
            }
        }
    }
}
