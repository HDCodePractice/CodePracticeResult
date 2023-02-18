
public func creatBoard(
    _ column:Int, 
    _ row:Int
)->[[String]]{
    let board = Array(repeating:(Array(repeating:"n",count:column)),count:row)
    return board
}
