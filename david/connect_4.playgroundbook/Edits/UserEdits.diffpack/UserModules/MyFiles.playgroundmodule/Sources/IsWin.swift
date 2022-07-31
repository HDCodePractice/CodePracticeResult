
public func isWin(
    _ coordinate:[Int],
    _ board:[[String]]
)->Bool{
    let countMark = 3
    var counts = 1
    var begins = 0
    var ends = board.count-1

//    for j in 1...board[coordinate[0]].count-1{
//        if board[coordinate[0]][j-1] == "n"{
//            break
//        }
//        
//        if board[coordinate[0]][j] == board[coordinate[0]][j-1]{
//            counts += 1
//        }else{
//            counts = 1
//        }
//        print(111111)
//        print(coordinate)
//        print(counts)
//        
//        if counts == countMark  {
//            print("\(board[coordinate[0]][j])"+" "+"win")
//            return true
//        }
//        
//    }
//    counts = 1
//    
//    for i in 1...board.count-1{
//
//        if board[i-1][coordinate[1]] == board[i][coordinate[1]]{
//            counts += 1
//        }else{
//            counts = 1
//        }
//        print(222222)
//        print(coordinate)
//        print(counts)
//        if counts == countMark && board[i][coordinate[1]] != "n" {
//            print("\(board[i][coordinate[1]])"+" "+"win")
//            return true
//        }
//    }
//    counts = 1
    
    
//    if coordinate[0]<board.count-3 && coordinate[1]<board[0].count-3 {
//        print(coordinate)
//        print(board.count)
//        for i in 1...3{
//            if board[coordinate[0]][coordinate[1]]==board[coordinate[0]+i][coordinate[1]+i]{
//                counts += 1
//                print("1111111")
//            }else{
//                print("2222222")
//                counts = 1
//            }
//            print("000000")
//            if counts == countMark && board[coordinate[0]][coordinate[1]] != "n"  {
//                                print("\(board[coordinate[0]][coordinate[1]])"+" "+"win")
//                                return true
//                            }
//        }
//    }
    
    for i in 1...board.count-1{
        for j in 1...board[0].count-1 {
            if board[i][j]=="n"{
                counts = 1
                break
            }
            print(board[coordinate[0]][coordinate[1]])
            if board[i-1][j-1] == board[i][j]  { 
                if board[i][j] == board[coordinate[0]][coordinate[1]]{
                    counts += 1
                }
//                counts += 1
                print(777777)
                print(i,j)
                print(coordinate)
                print(counts)
                print(board[i][j])
            }else{
                counts = 1
                
            }
            print(counts)
            
            if counts == countMark{
                print("\(board[i][j])"+" "+"win")
                
                print(333333)
                print(i,j)
                print(coordinate)
                print(counts)
                return true
            }
        }
    }
    counts = 1
//    
//    for i in 1...board.count-1{
//        for j in 0...board[coordinate[0]].count-2 {
//            if board[i-1][j+1] == board[i][j] && board[i][j] != "n"{
//                counts += 1
//            }else{
//                counts = 1
//                
//            }
//            print(444444)
//            print(coordinate)
//            print(counts)
//            if counts == countMark && board[i][j] != "n"  {
//                print("\(board[i][j])"+" "+"win")
//                return true
//            }
//        }
//    }
//    counts = 1
    
    return false
}

