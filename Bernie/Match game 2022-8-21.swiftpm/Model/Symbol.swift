import SwiftUI

//struct Symbol

struct Symbol: Hashable {
    var name: String 
    var isFlipped: Bool
    
    
    func showSymbolName(symbol : Symbol)->String{
        let symbolString = "\(symbol.name)/ \(symbol.isFlipped) "
        return symbolString
    }
    
}
