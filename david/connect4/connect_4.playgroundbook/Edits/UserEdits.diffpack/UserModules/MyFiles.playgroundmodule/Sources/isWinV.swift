//
func isWinV(
    coordinate:[Int],
    board:[[String]],
    countMark:Int = 3
)->Bool{
    var counts = 1
    var begins = 0
    var ends = board.count-1
    
    for j in 1...board[coordinate[0]].count-1{
        if board[coordinate[0]][j-1] == "n"{
            break
        }
        
        if board[coordinate[0]][j] == board[coordinate[0]][j-1]{
            counts += 1
        }else{
            counts = 1
        }
        if counts == countMark  {
            return true
        }
    }
    counts = 1
    return false
}
