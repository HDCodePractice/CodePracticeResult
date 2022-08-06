//
func isWinH(
    coordinate:[Int],
    board:[[String]],
    countMark:Int = 3
)->Bool{
    var counts = 1
    var begins = 0
    var ends = board.count-1
    
    
    
    for i in 1...board.count-1{
        
        if board[i-1][coordinate[1]] == board[i][coordinate[1]]{
            counts += 1
        }else{
            counts = 1
        }
//        print(222222)
//        print(coordinate)
//        print(counts)
        if counts == countMark && board[i][coordinate[1]] != "n" {
//            print("\(board[i][coordinate[1]])"+" "+"win")
            return true
        }
    }
    counts = 1
    
    
    if coordinate[0]<board.count-3 && coordinate[1]<board[0].count-3 {
//        print(coordinate)
//        print(board.count)
        for i in 1...3{
            if board[coordinate[0]][coordinate[1]]==board[coordinate[0]+i][coordinate[1]+i]{
                counts += 1
//                print("1111111")
            }else{
//                print("2222222")
                counts = 1
            }
//            print("000000")
            if counts == countMark && board[coordinate[0]][coordinate[1]] != "n"  {
//                print("\(board[coordinate[0]][coordinate[1]])"+" "+"win")
                return true
            }
        }
    }
    
    
    
    return false
}

