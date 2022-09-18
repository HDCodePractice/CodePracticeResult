
func creatBoard(
    column:Int, 
    row:Int
)->[[String]]{
    let board = Array(repeating:(Array(repeating:"n",count:column)),count:row)
    return board
}
