
public var players = [[Int]]()

public func startGame(playerNumber: Int=2, suitsNumber: Int=3){
    shuffleCards()
    players=Array(repeating: [], count: playerNumber)
    for i in 0..<playerNumber{
        sendCards(player: i, number: 2)
    }
}

public func sendCards(player: Int,number: Int=1){
    if cards.isEmpty{
        shuffleCards()
    }
    for i in 1...number{
        guard let singleCard = cards.first else { return }
        players[player].append(singleCard)
        cards.remove(at: 0)
    }
}
