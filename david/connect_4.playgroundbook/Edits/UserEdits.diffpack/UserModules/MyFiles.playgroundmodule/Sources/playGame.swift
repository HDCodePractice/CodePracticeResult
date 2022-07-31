public func playGame(
    _ board:[[String]] 
)->[[String]]{
    
    var winRecord = false //胜负标记
    var chessMark = -1 
    var chessman = ""
    var board = board
    var coordinate = [Int]()
    
    var columnChoinces = [String]()
    
    for i in 0...board.count-1{
        columnChoinces.append(String(i))
    }//这个是做下拉菜单的选项
    
    while !winRecord{

        var columnChoice = Int(
            getInput(
                inputPrompt: "please input your choice!",
                inputElements:columnChoinces,
                errorPrompt: "again",
                defaultInput: "0"
            )
        )!
        
        var playGame = mutiColumn(board, chessMark, columnChoice)
        coordinate = playGame.0
        //    coordinate = playGame.coordinate
        board = playGame.1
        //    board = playGame.board
        
        
        winRecord = isWin(coordinate,board)
        if playGame.fullMark{
            chessMark *= -1
//            当填满一个column时候，再填入时候，棋子颜色不会变
        }
    }
    
    
    return board
}

