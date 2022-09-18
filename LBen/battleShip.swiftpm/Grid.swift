import SwiftUI
import Foundation
struct Grid: Hashable,Identifiable {
    let id = UUID()
    var x : Int
    var y : Int
    var background : Color
    var opacity : Double
    var gridStatus: GridStatus
    
    
    
}
