
import SwiftUI

struct ProgressBar: View {
    @Binding var value: Int
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color(UIColor.systemTeal))
                if self.value < 30 {
                    Rectangle().frame(width: min(CGFloat(Float(self.value)/200)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                        .foregroundColor(Color(UIColor.systemRed))
                } else if self.value < 60 && self.value >= 30 {
                    Rectangle().frame(width: min(CGFloat(Float(self.value)/200)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                        .foregroundColor(Color(UIColor.systemOrange))
                } else if self.value < 90 && self.value >= 60 {
                    Rectangle().frame(width: min(CGFloat(Float(self.value)/200)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                        .foregroundColor(Color(UIColor.systemYellow))
                } else {
                    Rectangle().frame(width: min(CGFloat(Float(self.value)/200)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                        .foregroundColor(Color(UIColor.systemGreen))
                }
            }.cornerRadius(45.0)
        }
    }
}
