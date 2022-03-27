import SwiftUI

struct Line: View {
    let start: CGPoint
    let end: CGPoint
    let color: Color
    let type: String
    
    var body: some View {
        Path{ path in
            path.move(to: start)
            path.addLine(to: end)
        }
        .strokedPath(StrokeStyle(lineWidth:20, lineCap: .round))
        .foregroundColor(color)
    }
}
