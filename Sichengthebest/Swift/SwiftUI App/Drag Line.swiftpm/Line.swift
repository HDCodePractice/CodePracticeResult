//
//  File.swift
//  Drag Line
//
//  Created by Sicheng Jiang on 2022-03-05.
//

import SwiftUI

struct Line: View {
    let start:CGPoint
    let end:CGPoint
    var body: some View {
        Path {path in
            path.move(to: start)
            path.addLine(to: end)
        }
        .strokedPath(StrokeStyle(lineWidth: 20, lineCap: .round))
    }
}

struct Line_Previews: PreviewProvider {
    static var previews: some View {
        Line(start:CGPoint(x:50,y:8),end:CGPoint(x:250,y:500))
    }
}
