//
//  File.swift
//  DrawLine
//
//  Created by Qianji Yao on 2022/3/5.
//

import SwiftUI

struct Line: View {
    @State private var bgColor = Color.blue
    let color : Color
    let start:CGPoint
    let end:CGPoint
    var body: some View {
        Path{path in
            
            path.move(to: start)
            path.addLine(to: end)
        }
        .strokedPath(StrokeStyle(lineWidth:20,lineCap: .round))
        .foregroundColor(color)
        
        
    }
}

struct Line_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
//            Line(start: CGPoint(x: 100, y: 200), end: CGPoint(x: 300, y: 700,))
//            Line(start: CGPoint(x: 100, y: 200), end: CGPoint(x: 300, y: 400))
//            Line(start: CGPoint(x: 100, y: 200), end: CGPoint(x: 300, y: 100))
        }
        
    }
}
