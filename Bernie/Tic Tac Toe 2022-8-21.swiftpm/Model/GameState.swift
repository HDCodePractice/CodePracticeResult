enum GameState{
    case Won
    case Full
    case Continue
    
    func getTitle()->String{
        switch self{
        case .Won:
            return "赢了"
        case .Full:
            return "平了"
        case .Continue:
            return "游戏进行中"
        }
    }
}

