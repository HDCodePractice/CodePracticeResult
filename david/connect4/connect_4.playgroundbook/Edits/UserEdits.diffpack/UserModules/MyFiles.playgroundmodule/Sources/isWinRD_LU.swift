func isWinRD_LU(
    coordinate:[Int],
    board:[[String]],
    countMark:Int=3
)->Bool{
    var counts = 1
    var x = coordinate[0]
    var y = coordinate[1]
    
    for i in 1...countMark{
        if x-i>=0 && y+i<board[0].count {
            if board[x-i][y+i]==board[x-i+1][y+i-1] {
                if !(board[x-i][y+i]=="n"){ 
                    counts += 1
                }
            }
        }
        if  x+i<board.count && y-i>=0{
            if board[x+i][y-i]==board[x+i-1][y-i+1] {
                if !(board[x+i][y-i]=="n"){
                    counts += 1
                }
            }
        }
        if counts == countMark{
            return true
        }
    }
    counts = 1
    return false
}

// ***---test statements---***

//                    print("------222-------")
//                    print("coordinate = \(coordinate)")
//                    print("x = \(x) y = \(y)")
//                    print("i = \(i)")
//                    print("counts = \(counts)")
//                    print("board[\(x)][\(y)]=\(board[x][y])")
//                    print("board[\(x+i)][\(y-i)]=\(board[x+i][y-i])")
//                    print("board[\(x+i-1)][\(y-i+1)]=\(board[x+i-1][y-i+1])")
//                    print("-------end-222-end-----")
//    print("counts = \(counts)")
//    print("\n******END******\n")




