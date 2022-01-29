import Foundation

struct Game {
    var PlayerWins: Int = 0
    var PlayerLoses: Int = 0
    var PlayerTies: Int = 0
    var Winstreak: Int = 0
    var Game: Bool = false
    var winPer: Bool = true
    var ws: Bool = true
    var pve: Bool = false
    var Player: String = ""
    var Computer: String = ""
    var Result: String {
        if Player == Computer {
            return "Tied"
        } else if (Player == "Rock" && Computer == "Scissors") || (Player == "Scissors" && Computer == "Paper") || (Player == "Paper" && Computer == "Rock") {
            return "Won"
        }
        return "Lost"
    }
    var WinPercent: Double {
        if PlayerWins + PlayerLoses == 0 {
            return 0.00
        }
        return (Double(PlayerWins)/(Double(PlayerWins)+Double(PlayerLoses)))*100
    }
    mutating func genComputer() {
        let outcomes = ["Rock","Paper","Scissors"]
        Computer = outcomes.randomElement()!
        if Result == "Tied" {
            PlayerTies += 1
        } else if Result == "Won" {
            PlayerWins += 1
            Winstreak += 1
        } else {
            PlayerLoses += 1
            Winstreak = 0
        }
    }
}
