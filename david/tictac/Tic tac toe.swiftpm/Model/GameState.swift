enum GameState{
    case Win
    case Full
    case Continue
    
    func getTitle()->String{
        switch self{
        case .Win:
            return "win"
        case .Full:
            return "deuce"
        case .Continue:
            return "continue"
        }
    }
}

