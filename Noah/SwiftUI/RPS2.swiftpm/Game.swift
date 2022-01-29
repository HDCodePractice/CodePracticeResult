struct Game{
    var computer : String = "rock"
    var player: String = "rock"
    var won : Int = 0
    var lost : Int = 0
    var tied : Int = 0
    var result : String {
        if computer == player {
            return "Tied"
        }
        
        if (player=="rock"&&computer=="scissors") ||
            (player=="scissors"&&computer=="paper") ||
            (player=="paper"&&computer=="rock") {
            return "Won"
        }
        
        if (player=="scissors"&&computer=="rock") ||
            (player=="paper"&&computer=="scissors") ||
            (player=="rock"&&computer=="paper") {
            return "Lost"
        }
        return "Choose One"
    }
    
    mutating func genComputer(){
        let outcome = ["rock","scissors","paper"]
        computer = outcome.randomElement() ?? "rock"
    }
    
}
