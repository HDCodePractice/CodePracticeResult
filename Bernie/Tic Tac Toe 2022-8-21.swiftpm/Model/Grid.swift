import SwiftUI

struct Grid: Hashable, Identifiable{
    let id = UUID()
    var chess : Chess
    var x : Int
    var y : Int
    
    func isEmpty()->Bool{
        if chess == .null{
            return true
        }
        return false
    }
    
    mutating func changChess(newChess: Chess)->Bool{
        if chess == .null{
            chess = newChess
            return true
        }
        return false
    }
}
