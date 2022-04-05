
import SwiftUI
struct Line : View {
    let id = UUID()
    let start : CGPoint
    let end : CGPoint
    
    var body: some View{
        Path{ path in
            path.move(to: start)
            path.addLine(to: end)
        }
        .strokedPath(StrokeStyle(lineWidth: 10, lineCap: .round))
    }
}

extension Line:Identifiable{}
