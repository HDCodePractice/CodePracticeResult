import Foundation
class ViewModel {
    var display = "edew"
    var chessBoard : [[ChessBoardItem]] = []
    static var changer = 1
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
//    func checkWin(){
//        for i in 1 ... 19{
//            for j in 1 ... 19{
//                if chessBoard[i][j]==ChessBoardItem(background: "Mid2",chess: "2") || chessBoard[i+1][j]==ChessBoardItem(background: "Mid2",chess: "2") || chessBoard[i+2][j]==ChessBoardItem(background: "Mid2",chess: "2") || chessBoard[i+3][j]==ChessBoardItem(background: "Mid2",chess: "2") || chessBoard[i+4][j]==ChessBoardItem(background: "Mid2",chess: "2"){
//                    display = "You Win!"
//                }
//            }
//        }
//    }
    func change() {
        chessBoard[0][1]=ChessBoardItem(background: "Mid2",chess: "no")
    }
    static func changePiece() -> ChessBoardItem {
        print(changer)
        if changer == 1{
            changer = 2
            return ChessBoardItem(background: "Mid2", chess: "no")
        }else if changer == 2{
            changer = 1
            return ChessBoardItem(background: "Mid2", chess: "no")
        }
        return ChessBoardItem(background: "Mid2", chess: "no")

    }
}
struct ChessBoardItem: Identifiable,Hashable{
    let id:UUID = UUID()
    var background = "Mid2"
    var chess = "no"
}
