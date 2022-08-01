import SwiftUI

struct ContentView: View {
    var chessBoard : [[String]] = []
    
    init(){
        
        chessBoard = genChessBoard()
        
        
        var chessName : [String] = ["炮","炮","俥","傌","傌","俥","车","车","马","马"]
        var chessRow : [Int] = [7,7,9,9,9,9,0,0,0,0]
        var chessColumn : [Int] = [1,7,0,1,7,8,0,8,1,7]
        
        for i in stride(from: 0, to: 9, by: 2){
            chessName.append("兵")
            chessRow.append(6)
            chessColumn.append(i)
        }
        for i in stride(from: 0, to: 9, by: 2){
            chessName.append("卒")
            chessRow.append(3)
            chessColumn.append(i)
        }
        
        for i in 0..<chessName.count{
            chessBoard[chessRow[i]][chessColumn[i]]=chessName[i]
        }
        
    }
    var body: some View {
        VStack{
            ForEach(chessBoard, id: \.self){row in
                HStack{
                    ForEach(row, id: \.self){item in
                        ZStack{
                            Circle().fill(.orange)
                            Text(item)
                        }
                }
                }
            }
            
        }
    }
    func genChessBoard()->[[String]]{
        var board : [[String]] = []
        for _ in 0...9{
            var row = [String]()
            for _ in 0...8{
                row.append("--")
            }
            board.append(row)
        }
        return board
    }
}

