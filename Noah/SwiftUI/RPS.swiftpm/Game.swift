var PlayerStats: [String] = []

struct Game {
    var Game: Bool = false
    var Player: String = ""
    var Computer: String = ""
    
    mutating func play() -> [String] {
        let outcomes = ["Rock","Paper","Scissors"]
        let outcome = outcomes.randomElement()!
        Computer = outcome
        var Result: String {
            if Player == Computer {
                PlayerStats.append("T")
                return "Tied"
            } else if (Player=="Rock"&&Computer=="Scissors")||(Player=="Scissors"&&Computer=="Paper")||(Player=="Paper"&&Computer=="Rock") {
                PlayerStats.append("W")
                return "Won"
            } else if (Player=="Scissors"&&Computer=="Rock")||(Player=="Paper"&&Computer=="Scissors")||(Player=="Rock"&&Computer=="Paper") {
                PlayerStats.append("L")
                return "Lost"
            }
            return "Null"
        }
        return [Result, Computer]
    }
    
    mutating func GetStats() -> [Int] {
        var PlayerWins: Int = 0
        var PlayerLoses: Int = 0
        var PlayerTies: Int = 0
        for each in PlayerStats {
            if each == "T" {
                PlayerTies += 1
            } else if each == "L" {
                PlayerLoses += 1
            } else if each == "W" {
                PlayerWins += 1
            }
        }
        return [PlayerTies, PlayerWins, PlayerLoses]
    }
}
