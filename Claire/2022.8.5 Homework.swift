// 生成一个10x9的空格子,格子里放了初始的棋子
// HomeWork
// 1. 把所有的棋子都放进去
// 2. checkHorse写一个函数，它有一个参数[[Int]]。例[[0,1],[6,9]]代表想把马从0,1走到6,9。函数返回Bool，告诉我这个马是否可以走到这个位置。马走动的方法是一直一斜，即先横着或直着走一格，然后再斜着走一个对角线，俗称“马走日”。马一次可走的选择点可以达到四周的八个点，故有“八面威风”之说。如果在要去的方向有别的棋子挡住，马就无法走过去，俗称“蹩马腿”。

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


var chessName : [String] = ["炮","炮","俥","傌","傌","俥","车","车","马","马","相","相","象","象","仕","仕","士","士","将","帥","砲","砲"]
var chessRow : [Int] = [7,7,9,9,9,9,0,0,0,0,9,9,0,0,9,9,0,0,0,9,2,2]
var chessColumn : [Int] = [1,7,0,1,7,8,0,8,1,7,2,6,2,6,3,5,3,5,4,4,1,7]


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

func showBoard(board:[[String]]){
    var showString = ""
    for row in board{
        for i in row{
            showString += i
        }
        showString += "\n"
    }
    show(showString)
}

for i in 0..<chessName.count{
    chessBoard[chessRow[i]][chessColumn[i]]=chessName[i]
}

func checkHorse(board:[[String]],positions:[[Int]])->Bool{
    let from = positions[0]
    let to = positions[1]
    // 检查from上放的是不是马或傌
    if ["马","傌"].contains(board[from[0]][from[1]]) {
        // from 到 to 是不是一个日
        if abs(from[0]-to[0])+abs(from[1]-to[1])==3 {
            // 是不是有蹩马腿
            // 向下的日
            if to[0]-from[0]==2{
                if board[from[0]+1][from[1]]=="--"{
                    return true
                }
            }
            // 向上的日
            if from[0]-to[0]==2{
                if board[from[0]-1][from[1]]=="--"{
                    return true
                }
            }
            // 向左的日
            if from[1]-to[1]==2{
                if board[from[0]][from[1]-1]=="--"{
                    return true
                }
            }
            // 向右的日
            // 向左的日
            if to[1]-from[1]==2{
                if board[from[0]][from[1]+1]=="--"{
                    return true
                }
            }
        }
    }
    return false
}

func checkElephant(board:[[String]], positions:[[Int]])->Bool{
    let from = positions[0]
    let to = positions[1]
    
    if ["象","相"].contains(board[from[0]][from[1]]){
        id abs(from[0]-to[0])+abs(from[1]-to[1])==3{
          return true
        }
    }
    return false
}


let c = checkHorse(board: chessBoard, positions: [[0,2],[2,0]])
let e = checkElephant(board: chessBoard, positions: [[0,2],[2,0]])

print(c)
showBoard(board: chessBoard)
