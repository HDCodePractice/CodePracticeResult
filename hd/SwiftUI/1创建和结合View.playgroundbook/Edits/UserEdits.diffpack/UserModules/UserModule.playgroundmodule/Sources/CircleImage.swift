import SwiftUI

public struct CircleImage: View {
    public init(){}
    public var body: some View {
        Image(uiImage: UIImage(named: "turtlerock@2x.jpg")!)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 4))
    }
}
