import SwiftUI

struct Grid:Hashable,Identifiable {
    let id = UUID()
//    var gridState : GridState
    var ship : Ship
    var h : Int
    var w : Int
//    var status : GridState = .empty
    
//    func isGridEmpty()->Bool{
//        if ship.shipStatus()=="empty"{
//            return true
//        }
//        return false
//    }
    
    
        
}
