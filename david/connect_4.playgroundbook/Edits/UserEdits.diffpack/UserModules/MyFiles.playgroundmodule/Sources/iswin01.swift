
func isWin01(
    _ board:[[String]]
)->(
    mark:Bool,
    chessman:String
){
    var count1 = 1
    //    var count2 = 1
    //    var count3 = 1
    //    var count4 = 1
    
    var begins = 0
    var ends = board.count-1
    
    var chessTemp = ""
    for i in 0...board.count-1{
        for j in 0...board[i].count-2{
            if board[i][j] == "n"{
                break
            }
            
            if board[i][j] == board[i][j+1] {
                
                count1 += 1
                //                chessTemp = board[i][j]
                
                print(11111)
                print(count1)
                print(i,j)
                print(board[i][j])
                
            }else{
                count1 = 1
                //                count2 = 1
                //                count3 = 1
                //                count4 = 1
                
                print(333333)
                print(i,j)
                print(board[i][j])
                print(count1)
                
            }
            chessTemp = board[i][j]
            
            
            if count1 == 3  {
                print(55555)
                print(chessTemp)
                print(count1)
                
                return (true,chessTemp)
            }
            
        }
        
    }
    return (false,chessTemp)
}
