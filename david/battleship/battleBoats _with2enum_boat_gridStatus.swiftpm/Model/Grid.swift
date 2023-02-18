import SwiftUI

struct Grid:Hashable,Identifiable {
    let id = UUID()
    var gridState : GridState
    var boat : Boat
    var h : Int
    var w : Int
    
    func isEmpty()->Bool{
        if gridState.getFile()=="empty"{
            return true
        }
        return false
    }
        
}
