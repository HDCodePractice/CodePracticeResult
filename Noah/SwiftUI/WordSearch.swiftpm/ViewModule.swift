import Foundation
import SwiftUI

struct ViewModule {
    var start: [Int] = [0,0]
    var end: [Int] = [0,0]
    var color: Color = Color(.sRGB, red: 0.0, green: 0.0, blue: 0.0)
    var lines: [LinePoints] = []
//    var start = CGPoint(x: 0, y: 0)
//    var end =  CGPoint(x: 0, y: 0)
//    var color = Color(.sRGB, red: 0.0, green: 0.0, blue: 0.0)
//    var type = ""
//    var lines : [LinePoints] = []
}

struct LinePoints: Identifiable{
    let id = UUID()
    var start: [Int]
    var end: [Int]
    var color: Color
//    var start : CGPoint
//    var end : CGPoint
//    var color: Color
//    var type: String
}
