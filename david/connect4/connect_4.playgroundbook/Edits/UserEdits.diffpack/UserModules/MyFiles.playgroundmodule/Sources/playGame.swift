public func playGame(
    board:[[String]],
    chessMark:Int = -1,
    winRecord:Bool
)->(
    board:[[String]],
    coordinate:[Int],
    fullMark:Bool
){
    var chessMark = chessMark //换棋子参数
    var chessman = ""  //棋子颜色或种类
    var board = board  //棋盘含棋子
    var fullMark:Bool //步数，用来减少计算量，并提示该谁走棋
    var winRecord = winRecord //胜负标记
    
    var columnChoinces = [String]() //棋手选择下子的列
    
    for i in 0...board.count-1{
        columnChoinces.append(String(i))
    }//这个是做下拉菜单的选项
    
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
    
    return (board,coordinate,fullMark)
}

