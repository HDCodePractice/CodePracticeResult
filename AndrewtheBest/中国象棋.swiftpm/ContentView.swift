
func genChessBoard()->[[String]]{
    var board : [[String]] = []
    for i in 0...9{
        var row = [String]()
        for j in 0...8{
            row.append("--")
        }
        board.append(row)
    }
    return board
}

var chessBoard = genChessBoard()


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
    //    show("\(i) \(chessName[i]) \(chessRow[i]) \(chessColumn[i])")
    chessBoard[chessRow[i]][chessColumn[i]]=chessName[i]
}

var data : String  = ""
for subarray in chessBoard{
    data += "\n"
    for i in subarray{
        data += i
    }
}
show(data)
