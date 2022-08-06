func mutiColumn(
    _ board:[[String]],
    _ chessMark:Int,
    _ columnChoice:Int
)->(
    coordinate:[Int],
    board:[[String]],
    fullMark:Bool
){
    
    var board = board
    var coordinate:[Int] = Array(repeating:0, count: 2)
    
    var chessman = (chessMark == -1 ? "♠️":"♥️")
    
    var oneColumTemp = oneColum(board[columnChoice],chessman)
    
    var fullMark = oneColumTemp.fullMark
    
    board[columnChoice] = oneColumTemp.column
    coordinate[0] = columnChoice
    coordinate[1] = oneColumTemp.rowNum
    
    for i in 0...board.count-1{
        show("\(i)    \(board[i])\n")
    }
    return(coordinate,board,fullMark)
}

