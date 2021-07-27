
import CoreGraphics

struct HexagonParameters {
    struct Segment {
        let line: CGPoint
        let curve: CGPoint
        let control: CGPoint
    }
    static let adjustment: CGFloat = 0.085
    
    static let segments = [
        Segment(
            line:    CGPoint(x: 2.5, y: 1.5),
            curve:   CGPoint(x: 0.40, y: 0.05),
            control: CGPoint(x: 0.50, y: 0.00)
        ),
        Segment(
            line:    CGPoint(x: 0, y: 1.75),
            curve:   CGPoint(x: 0.00, y: 0.30),
            control: CGPoint(x: 0.00, y: 0.25)
        ),
        Segment(
            line:    CGPoint(x: 2, y: 3),
            curve:   CGPoint(x: 0.00, y: 0.30),
            control: CGPoint(x: 0.00, y: 0.25)
        ),
        Segment(
            line:    CGPoint(x: 1, y: 6),
            curve:   CGPoint(x: 0.05, y: 0.80),
            control: CGPoint(x: 0.00, y: 0.75)
        ),
        Segment(
            line:    CGPoint(x: 3, y: 4),
            curve:   CGPoint(x: 0.05, y: 0.80),
            control: CGPoint(x: 0.00, y: 0.75)
        ),
        Segment(
            line:    CGPoint(x: 5, y: 6),
            curve:   CGPoint(x: 0.60, y: 0.95),
            control: CGPoint(x: 0.50, y: 1.00)
        ),
        Segment(
            line:    CGPoint(x: 4, y: 3),
            curve:   CGPoint(x: 0.60, y: 0.95),
            control: CGPoint(x: 0.50, y: 1.00)
        ),
        Segment(
            line:    CGPoint(x: 6, y: 1.75),
            curve:   CGPoint(x: 0.60, y: 0.95),
            control: CGPoint(x: 0.50, y: 1.00)
        ),
        Segment(
            line:    CGPoint(x: 3.5, y: 1.5),
            curve:   CGPoint(x: 0.60, y: 0.95),
            control: CGPoint(x: 0.50, y: 1.00)
        )
    ]
    
}
