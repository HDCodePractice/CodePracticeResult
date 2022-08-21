
//// 1.定义一个Chess,它是一个enum，一种是X，一种是O，还有一种是无，你可以使用这个enmm得到title、颜色
//// 2.定义一个Grid，它是一个struct，它有column、row、chess属性
//// 3. 使用 bord : [[Grid]] 存储棋盘，你需要写一个showBord帮你随时查看棋盘
//// 4. putChess(bord:[[Grid]],chess:Chess,column,row) -> Bool ，返回如果是false，哪就代表这个位置不能下到一个棋
//// 5. isGameOver(bord:[[Grid]]) -> Bool检查有没有人赢了比赛或所有的格子都满了
//
//enum Chess{
//    case X
//    case O
//    case noChess
//    
//    func getColor()->String{
//        switch self{
//        case.O:
//            return "red"
//        case.X:
//            return  "green"
//        default:
//            return "clear"
//        }
//    }
//    
//    func getChessTitle()->String{
//        switch self{
//        case.X:
//            return "X"
//        case.O:
//            return "O"
//        default:
//            return "n"
//        }
//    }
//    
//    func getShowString()->String{
//        return "\(getChessTitle())/\(getColor())"
//    }
//    
//    func next()->Chess{
//        switch self{
//        case .O:
//            return .X
//        case .X:
//            return .noChess
//        default:
//            return .O
//        }
//    }
//    
//}
//
//
//struct Grid{
//    var chess:Chess
//    var columnNum:Int
//    var rowNum:Int
//    // func showString()->String{  
//    //   let showGridString = chess.showString()+"\n"+"rowNum: "+String(rowNum)+"\n"+"columnNum: "+String(columnNum)
//    //   return (showGridString)
//    // }
//}
//
//func genBoard(
//    column:Int, 
//    row:Int
//)->[[Grid]]{
//    var board:[[Grid]]=[]
//    let chess = Chess.noChess
//    for i in 0..<row{
//        var colTemp:[Grid]=[]
//        for j in 0..<column{
//            let grid = Grid(chess: chess, columnNum: j, rowNum: i)
//            colTemp.append(grid)
//        }
//        board.append(colTemp)
//    }
//    return board
//}
//
//func showBoard(playBoard:[[Grid]])->String{
//    var showString:String = ""
//    for i in playBoard{
//        for j in i{
//            showString += j.chess.getShowString() + "[ \(j.columnNum) , \(j.rowNum)] ; "
//            // print(j.chess.getShowString(),terminator:"  ")
//        }
//        showString += "\n"
//        // print()
//    }
//    return showString
//}
//
//func putChess(
//    board:[[Grid]],
//    chess:Chess,
//    columnN:Int,
//    rowN:Int
//)->Bool{
//    if board[columnN][rowN].chess.getChessTitle() == "n"{
//        return true
//    }
//    return false
//}
//
//func playingBoard(
//    board:[[Grid]],
//    chess:Chess,
//    columnN:Int,
//    rowN:Int  
//)->[[Grid]]{
//    var playingBoard = board
//    if putChess(board: board, chess: chess, columnN: columnN, rowN: rowN){
//        playingBoard[columnN][rowN] = Grid(chess: chess, columnNum: columnN, rowNum: rowN)
//    } else{
//        playingBoard = board
//    }
//    return playingBoard
//}
//
//func isFull(board:[[Grid]])->Bool{
//    for i in board{
//        for j in i{
//            if j.chess.getChessTitle()=="n"{
//                return true
//            }
//        }
//    }
//    return false
//}
//
//func calBoard(board:[[Grid]])->[[Grid]]{
//    var calBoard:[[Grid]]=[]
//    var arrayTemp:[Grid]=[]
//    var ends:Int
//    //horizon
//    for i in 0..<board.count{
//        calBoard.append(board[i])
//    }
//    //vertical  
//    for i in 0..<board.count{
//        
//        for j in 0..<board[0].count{
//            arrayTemp.append(board[j][i])
//        }
//        calBoard.append(arrayTemp)
//        arrayTemp = []
//    }
//    //rd-lu
//    ends = (board.count>board[0].count ? board[0].count:board.count)
//    // here may be a bug? if ther are equal,it's ok. but if they are not euqal, maybe there will be missing arrays!
//    for i in 0..<ends{
//        
//        arrayTemp.append(board[i][i])
//    }
//    calBoard.append(arrayTemp)
//    arrayTemp = []
//    //ld-ru
//    for i in 0..<ends{
//        arrayTemp.append(board[i][ends-1-i])
//    }
//    calBoard.append(arrayTemp)
//    arrayTemp = []
//    return calBoard
//}
//
//func getCounts(subBoard:[Grid])->Int{
//    var counts = 1
//    var begins = ""
//    // var arrayTemp:[Grid]
//    for i in 0..<subBoard.count{
//        
//        if subBoard[i].chess.getShowString() == begins && 
//            subBoard[i].chess.getChessTitle() != "n"
//        {
//            counts += 1
//        }else{
//            begins = subBoard[i].chess.getShowString()
//            counts = 1
//        }
//    }
//    return counts
//}
//
//func isGameOver(board:[[Grid]])->Bool{
//    var counts = 0
//    for i in board{
//        counts = getCounts(subBoard: i)
//        if counts>=3{
//            return true
//        }
//        counts = 1
//    }
//    
//    //=====================================
//    // var begins = ""
//    // for i in 0..<board[0].count{
//    //   for j in 0..<board.count{
//    //      if board[j][i].chess.getShowString() == begins && 
//    //        board[j][i].chess.getChessTitle() != "n"
//    //     {
//    //       counts += 1
//    //     }else{
//    //       begins = board[j][i].chess.getShowString()
//    //       counts = 1
//    //     }
//    //   }
//    //   if counts>=3{
//    //       return true
//    //   }
//    //   counts = 1
//    // }
//    // if board[1][1].chess.getChessTitle() != "n"{
//    //   if board[0][0].chess.getShowString()==board[1][1].chess.getShowString() && 
//    //   board[1][1].chess.getShowString()==board[2][2].chess.getShowString(){
//    //     return true
//    //   }
//    //   if board[0][2].chess.getShowString()==board[1][1].chess.getShowString() && board[1][1].chess.getShowString()==board[2][0].chess.getShowString(){
//    //     return true
//    //   }
//    // }
//    return false  
//}
//
//func gameResults(board:[[Grid]],input:Chess)->String{
//    let calBoards = calBoard(board: board)
//    var outPut = ""
//    if isGameOver(board: calBoards){
//        outPut = "\(input) is win"
//    }else{
//        if !isFull(board: testBoard){
//            outPut = "Deuce!"
//        }else{
//            outPut = "Continue!"
//        }
//    }
//    return outPut
//}
//
//var chess = Chess.O
//var c = chess.next()
//var row = 3
//var column = 3
//
//var board = genBoard(column: column, row: row)
//
//var testBoard = [
//    [main.Grid(chess: main.Chess.X, columnNum: 0, rowNum: 0), 
//     main.Grid(chess: main.Chess.O, columnNum: 1, rowNum: 0), 
//     main.Grid(chess: main.Chess.X, columnNum: 2, rowNum: 0)], 
//    
//    [main.Grid(chess: main.Chess.O, columnNum: 0, rowNum: 1), 
//     main.Grid(chess: main.Chess.O, columnNum: 1, rowNum: 1), 
//     main.Grid(chess: main.Chess.X, columnNum: 2, rowNum: 1)],
//    
//    [main.Grid(chess: main.Chess.X, columnNum: 0, rowNum: 2), 
//     main.Grid(chess: main.Chess.X, columnNum: 1, rowNum: 2), 
//     main.Grid(chess: main.Chess.X, columnNum: 2, rowNum: 2)]]
//
//var input:Chess = .X
//
//var showString = showBoard(playBoard: testBoard)
//print(showString)
//var results = gameResults(board: testBoard,input: input)
//print(results)
