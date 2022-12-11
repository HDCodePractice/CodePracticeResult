// who is max of player1[Int] max and player2[Int] max 
// 0: Tie 1: Player1 2: Player2
public func checkWon(player1: [Int], player2: [Int])->Int{
    let player1Max = player1.max() ?? 0
    let player2Max = player2.max() ?? 0
    if player1Max > player2Max{
        return 1
    }else if player2Max > player1Max{
        return 2
    }
    return 0
}
