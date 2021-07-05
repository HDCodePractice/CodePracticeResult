import SwiftUI
import PlaygroundSupport

struct CircleImage: View {
    init() {}
    var body: some View {
        Image(uiImage: UIImage(named: "turtlerock@2x.jpg")!)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 7)
    }
}

struct pfp: View {
    init() {}
    var body: some View {
        Image(uiImage: UIImage(named: "nebo-oblaka-zakat-anime-malchik-art-devochka-hangmoon-ostrov.jpg")!)
            .resizable()
            .frame(width: 50, height: 50)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 7)
    }
}
