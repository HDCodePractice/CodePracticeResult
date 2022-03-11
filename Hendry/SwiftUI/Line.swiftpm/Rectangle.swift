import SwiftUI

struct MyRectangle: View {
    let start:CGPoint
    let end: CGPoint
    var width : CGFloat{
        return abs((end.x - start.x)*2)
    }
    var height : CGFloat{
        return abs((end.y - start.y)*2)
    }
    
    var body: some View {
        Rectangle()
            .frame(width: width, height: height)
            .position(start)
    }
}

struct MyRectangle_Previews: PreviewProvider {
    static var previews: some View {
        MyRectangle(start: CGPoint(x: 100, y: 100), end: CGPoint(x: 200, y: 200))
    }
}
