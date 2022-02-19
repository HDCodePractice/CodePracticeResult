import SwiftUI

struct Position {
    var row: Int
    var col: Int
}

struct LineStyle {
    var opacity: Double
    var lineWidth: CGFloat
    var strokeColor: CGColor
}

struct Line: View {
    var cellSize: CGSize = .zero
    var startPos: Position?
    var endPos: Position?
    var lineStyle: LineStyle = LineStyle(
        opacity: 0.5,
        lineWidth: 40,
        strokeColor: UIColor.blue.cgColor
    )

    private func point(at pos: Position) -> CGPoint {
        return CGPoint (
            x: pos.row,
            y: pos.col
        )
    }
    // cellSize.width,
    // cellSize.height

    var body: some View {
        Path { path in
            path.move(to: point(at: startPos ?? Position(row: 2, col: 2)))
            path.addLine(to: point(at: endPos ?? Position(row: 8, col: 8)))
        }
        .stroke(style: StrokeStyle(lineWidth: lineStyle.lineWidth, lineCap: .round))
        .foregroundColor(.green)
    }
}

struct ContentView: View {
    @State var num = 0
    @State private var pt: CGPoint = .zero
    var body: some View {
        let myGesture = DragGesture(minimumDistance: 0, coordinateSpace: .global).onEnded({
            self.pt = $0.startLocation
        })
        Line(cellSize: CGSize(width: pt.x, height: pt.y-40), startPos: Position(row: Int(pt.x), col: Int(pt.y-40)))
        .border(Color.green)
        .contentShape(Rectangle())
        .gesture(myGesture)
//        if num == 0 {
//            ZStack {
//                Line(cellSize: CGSize(width: pt.x, height: pt.y-40), startPos: Position(row: Int(pt.x), col: Int(pt.y-40)))
//                .border(Color.green)
//                .contentShape(Rectangle())
//                .gesture(myGesture)
//            }
//
//        } else if num == 1 {
//            ZStack {
//                Line(cellSize: CGSize(width: pt.x, height: pt.y-40), endPos: Position(row: Int(pt.x), col: Int(pt.y-40)))
//                .border(Color.green)
//                .contentShape(Rectangle())
//                .gesture(myGesture)
//            }
//
//        }
        
    }
}
