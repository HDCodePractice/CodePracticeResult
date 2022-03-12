//
//  File.swift
//  DrawLine
//
//  Created by 老房东 on 2022-03-05.
//

import SwiftUI

struct Line: View {
    let start:CGPoint
    let end: CGPoint
    var body: some View {
        Path{ path in
            path.move(to: start)
            path.addLine(to: end)
        }
        .strokedPath(StrokeStyle(lineWidth:20,lineCap: .round))
    }
}

struct Line_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Line(
                start: CGPoint(x: 100, y: 200),
                end: CGPoint(x: 300, y: 100)
            )
            Line(
                start: CGPoint(x: 200, y: 100),
                end: CGPoint(x: 100, y: 100)
            )
            Line(
                start: CGPoint(x: 200, y: 500),
                end: CGPoint(x: 200, y: 200)
            )
        }
    }
}
