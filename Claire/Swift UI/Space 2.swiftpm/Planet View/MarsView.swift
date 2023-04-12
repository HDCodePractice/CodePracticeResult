import SwiftUI

struct Mars: View {
    var body: some View {
        Text("Mercury is the smallest planet in our solar system. It has a diameter of only about 3,031 miles (4,880 kilometers), which is about one-third the size of Earth. Despite its small size, Mercury is the second densest planet after Earth, which means that it has a relatively large core compared to its size.")
        
        Text("Mercury has a very long day and a very short year. It takes just 88 Earth days for Mercury to orbit the sun, but because it rotates very slowly on its axis, it takes 59 Earth days for one day to pass on Mercury. This means that one day on Mercury (the time it takes for the planet to complete one rotation) is almost two Mercury years (the time it takes for the planet to orbit the sun once).")
    }
}

struct Mars_Preview: PreviewProvider {
    static var previews: some View {
        Mars()
    }
}
