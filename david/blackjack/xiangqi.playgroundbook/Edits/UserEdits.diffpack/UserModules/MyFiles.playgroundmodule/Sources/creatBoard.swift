
public func genChessBoard()->[[String]]{
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

