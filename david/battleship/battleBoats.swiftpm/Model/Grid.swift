import SwiftUI

struct Grid:Hashable,Identifiable{
    let id = UUID()
    var gridStatus : GridStatus = .empty
    var ship:Ship = .None
    var h : Int
    var w : Int
    
    
    
}
