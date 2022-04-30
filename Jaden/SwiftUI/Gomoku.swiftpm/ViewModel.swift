import Foundation
struct ViewModel {
    var display = "Have Fun!"
    var chessBoard : [[ChessBoardItem]] = []
    var changer = 1
    init(){
        let size = 19
        for _ in 1 ... size{
            var row:[ChessBoardItem] = []
            for _ in 1 ... size{
                row.append(ChessBoardItem(background: "Mid2", chess: "no"))
            }
            chessBoard.append(row)
        }
    }

    mutating func change() {
        chessBoard[0][1]=ChessBoardItem(background: "Mid2",chess: "no")
    }
    mutating func clearBoard(item: ChessBoardItem) {
//        print(item.id)
        for i in 0..<chessBoard.count {
            // find click grid[item]
            for j in 0..<chessBoard.count{
                if chessBoard[i][j].id == item.id {
                    chessBoard[i][j]=ChessBoardItem(background: "Mid2",chess: "no")
                }
            }

        }
    }
    mutating func tapItem(item: ChessBoardItem) {
//        print(item.id)
        for i in 0..<chessBoard.count {
            // find click grid[item]
            for j in 0..<chessBoard.count{
                if chessBoard[i][j].id == item.id {
                    if item.chess == "no"{
                        if changer == 1{
                            chessBoard[i][j]=ChessBoardItem(background: "Mid2",chess: "2")
                            changer = 2
                            print(item.chess)
                        }else if changer == 2{
                            chessBoard[i][j]=ChessBoardItem(background: "Mid2",chess: "3")
                            changer = 1
                            print(item.chess)
                        }
                    }
                }
            }

        }
    }
}
struct ChessBoardItem: Identifiable,Hashable{
    let id:UUID = UUID()
    var background = "Mid2"
    var chess = "no"
}
