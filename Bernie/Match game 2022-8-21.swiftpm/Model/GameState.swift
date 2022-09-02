import SwiftUI

enum GameState{
    case Won
    case Countinue
    
    func getTitle()->String{
        print("hello world two!")
        switch self{
        case .Won:
            return "赢了"
        case .Countinue:
            return "游戏进行中"
        }
    }
}
