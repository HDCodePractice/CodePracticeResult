import SwiftUI

struct Grid: Hashable, Identifiable{
    let id = UUID()
    var symbol: Symbol
    var x: Int
    var y: Int
    
    mutating func canFlip()->Bool{
        if symbol.isFlipped == false{
            return true
        }
        return false
    }
}


