
import SwiftUI

struct RotatedBadgeSymbol: View {
    let angle: Angle
    
    var body: some View {
        BadgeSymbol()
            .padding(-71)
            .rotationEffect(angle, anchor: .bottom)
    }
}
