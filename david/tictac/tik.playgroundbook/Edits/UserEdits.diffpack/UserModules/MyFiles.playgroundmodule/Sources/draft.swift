//右下到左上方向最初算法
//if x>=y{
//    begins = (y-winMark+1<0 ? 0:y-winMark+1)
//    ends = (x+winMark-1 >= board.count ? board.count:x+winMark-1)
//    for i in 0...ends{
//        ld_ruChoice.append(board[x-y+i][begins+i])
//    }
//}else{
//    begins = (x-winMark+1<0 ? 0:x-winMark+1)
//    ends = (y+winMark-1>=board[0].count ? board[0].count-1:y+winMark-1)
//    for i in 0...ends{
//        ld_ruChoice.append(board[begins+i][y-x+i])
//    }
//}
//计算每个方向的得分
//------hScore------
//func hScores(rowChoice:[Grid],x:Int,y:Int)->Int{
//    var rowChoice = rowChoice
//    var hScore = 0
//    
//    for i in 0..<rowChoice.count{
//        if !(rowChoice[i].chess.style=="N"){
//            hScore += 1
//        }else{
//            hScore = 1
//        }
//    }
//    return hScore
//}
//
////------ld_ruScore------
//func ld_ruScores(board:[[Grid]],grid:Grid)->Bool{
//    
//    return false
//}
//
////-----lu_rdScores------
//func lu_rdScores(board:[[Grid]],grid:Grid)->Bool{
//    var board = board
//    var grid = grid
//    
//    return false
