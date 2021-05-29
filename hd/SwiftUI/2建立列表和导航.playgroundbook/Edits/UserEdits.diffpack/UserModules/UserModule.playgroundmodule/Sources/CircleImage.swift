/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 A view that clips an image to a circle and adds a stroke and shadow.
 */

import SwiftUI

public struct CircleImage: View {
    public init(){}
    public var body: some View {
        Image(uiImage: UIImage(named: "turtlerock@2x.jpg")!)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 7)
    }
}

public struct CircleImage2: View {
    var image:Image
    public init(image : Image){
        self.image = image
    }
    public var body: some View {
        image
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 7)
    }
}
