import SwiftUI

struct ViewModel{
    var start = CGPoint(x: 0, y: 0)
    var end = CGPoint(x: 0, y: 0)
    var lines : [LinePoints] = []
}
struct LinePoints: Identifiable{
    var id = UUID()
    var start : CGPoint
    var end :CGPoint
    var color: Color
}
