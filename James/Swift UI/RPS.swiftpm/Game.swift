import Foundation

struct Game{
    var computer : String = "rock"
    var player: String = "rock"
    var winstreak : Int = 0
    var losestreak : Int = 0
    var won : Int = 0
    var lost : Int = 0
    var tied : Int = 0
    var starting : Bool = true
    var result : String {
        if computer == player {
            print("both = \(player)")
            return "Tied"
        }
        if (player=="rock"&&computer=="scissors") ||
            (player=="scissors"&&computer=="paper") ||
            (player=="paper"&&computer=="rock") {
            print("player = \(player)")
            print("computer = \(computer)")
            winstreak += 1
            losestreak = 0
            return "Won"
        }
        if (player=="scissors"&&computer=="rock") ||
            (player=="paper"&&computer=="scissors") ||
            (player=="rock"&&computer=="paper") {
            print("player = \(player)")
            print("computer = \(computer)")
            winstreak = 0
            losestreak -= 0
            return "Lost"
        }
        return "Choose One"
    }
    mutating func genComputer(){
        let outcome = ["rock","scissors","paper"]
        computer = outcome.randomElement() ?? "rock"
    }
}
