import SwiftUI

struct MyCircle: View {
    let start:CGPoint
    let end: CGPoint
    var distance: Double{
        hypotenuse(a: Double(end.x-start.x), b:  Double(end.y-start.y)) * 2
    }

    var body: some View {
        Circle()
            .frame(width: distance, height: distance)
            .position(start)
    }
    
    
    private func hypotenuse(a: Double, b: Double) -> Double {
        return (a * a + b * b).squareRoot()
    }

}

struct MyCircle_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            MyCircle(start: CGPoint(x: 100, y: 100), end: CGPoint(x: 200, y: 200))
                .foregroundColor(.red)
            MyCircle(start: CGPoint(x: 0, y: 0), end: CGPoint(x: 100, y: 100))
                .foregroundColor(.yellow)
        }
    }
}
