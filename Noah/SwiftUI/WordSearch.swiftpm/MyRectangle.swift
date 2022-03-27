import SwiftUI

struct MyRectangle: View {
    let start: CGPoint
    let end: CGPoint
    let color: Color
    let type: String
    
    var body: some View {
        Rectangle()
            .frame(width: abs(Double(end.x-start.x)*2), height: abs(Double(end.y-start.y)*2))
            .position(start)
            .foregroundColor(color)
    }
}
