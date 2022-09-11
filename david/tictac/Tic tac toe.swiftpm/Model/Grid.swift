import SwiftUI

struct Grid: Hashable,Identifiable{
    let id = UUID()
    var chess:Chess
    var x : Int
    var y : Int
    
    func isEmpty()->Bool{
        if chess == .Null{
            return true
        }
        return false
    }
    
    mutating func changeChess(newChess:Chess)->Bool{
        if chess == .Null{
            chess = newChess
            return true
        }
        return false
    }
}
