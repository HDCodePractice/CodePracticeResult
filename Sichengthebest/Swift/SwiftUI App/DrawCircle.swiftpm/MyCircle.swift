import SwiftUI

struct MyCircle: View {
    let start:CGPoint
    let end: CGPoint
    let color: Color
    let type: String
    
    var distance: Double{
        hypotenuse(a: Double(end.x-start.x), b:  Double(end.y-start.y)) * 2
    }

    var body: some View {
        Circle()
            .frame(width: distance, height: distance)
            .position(start)
            .foregroundColor(color)
    }
    
    
    private func hypotenuse(a: Double, b: Double) -> Double {
        return (a * a + b * b).squareRoot()
    }

}
