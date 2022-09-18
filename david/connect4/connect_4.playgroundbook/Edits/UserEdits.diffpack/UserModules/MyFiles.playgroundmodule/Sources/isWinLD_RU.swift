func isWinLD_RU(
    coordinate:[Int],
    board:[[String]],
    countMark:Int = 4
)->Bool{
    var counts = 1
    var x = coordinate[0]
    var y = coordinate[1]
    
    for i in 1...3{
        if x-i>=0 && y-i>=0 {
            if board[x-i][y-i]==board[x-i+1][y-i+1] {
                if !(board[x-i][y-i]=="n"){
                    counts += 1
                }
            }
        }
        if  x+i<board.count && y+i<board[0].count{
            if board[x+i][y+i]==board[x+i-1][y+i-1] {
                if !(board[x+i][y+i]=="n"){
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

//print("------111-------")
//print("coordinate = \(coordinate)")
//print("x = \(x) y = \(y)")
//print("i = \(i)")
//print("counts = \(counts)")
//print("board[\(x)][\(y)]=\(board[x][y])")
////            print("board[\(x-i)][\(y-i)]=\(board[x-i][y-i])")
//
//print("------111-end-111------")

//counts = 1
//print("counts = \(counts)")
//print("******END******\n")






