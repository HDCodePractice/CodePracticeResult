public func playGame(
    board:[[String]],
    chessMark:Int = -1,
    winRecord:Bool
)->(
    board:[[String]],
    coordinate:[Int],
    fullMark:Bool,
    moveNum:Int
){
    var chessMark = chessMark //换棋子参数
    var chessman = ""  //棋子颜色或种类
    var board = board  //棋盘含棋子
//    var coordinate:[Int] = [] //最后一个棋子的位置坐标
    var fullMark:Bool
    var moveNum = Int() //步数，用来减少计算量，并提示该谁走棋
    var winRecord = winRecord //胜负标记
    
    var columnChoinces = [String]() //棋手选择下子的列
    
    for i in 0...board.count-1{
        columnChoinces.append(String(i))
    }//这个是做下拉菜单的选项
    
    //    while !winRecord{
    
    var columnChoice = Int(
        getInput(
            inputPrompt: "please input your choice!",
            inputElements:columnChoinces,
            errorPrompt: "again",
            defaultInput: "0"
        )
    )!
    
    var finalBoard = mutiColumn(board, chessMark, columnChoice)
    var coordinate = finalBoard.coordinate
    board = finalBoard.board
    fullMark = finalBoard.fullMark
    
    
    
    //        winRecord = isWin(coordinate: coordinate, board: board,countMark: 4,moveNum: moveNum)
    
    
    //        if finalBoard.fullMark{
    //            moveNum += 1
    //            chessMark *= -1
    //            
    ////            当填满一个column时候，再填入时候，棋子颜色不会变
    //        }
    
    return (board,coordinate,fullMark,moveNum)
}

