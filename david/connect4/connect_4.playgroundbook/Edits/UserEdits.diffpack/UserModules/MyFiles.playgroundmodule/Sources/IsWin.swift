public func isWin(
    coordinate:[Int],
    board:[[String]],
    countMark:Int = 4,
    moveNum:Int 
    
)->Bool{
    var coordinate:[Int] = coordinate
    //最后一个棋子的位置坐标
    
    if moveNum>countMark*2-3{
        if isWinRD_LU(coordinate: coordinate, board: board,countMark: countMark) 
            || isWinLD_RU(coordinate: coordinate, board: board,countMark: countMark) 
            || isWinH(coordinate: coordinate, board: board,countMark: countMark) 
            || isWinV(coordinate: coordinate, board: board,countMark: countMark)
        
        {
            return true
        }
    }
    
    return false
}
