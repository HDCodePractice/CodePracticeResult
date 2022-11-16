// Code inside modules can be shared between pages and other source files.

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

