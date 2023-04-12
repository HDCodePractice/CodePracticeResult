import SwiftUI

struct Mercury: View {
    var body: some View {
        Text("Mercury is the smallest planet in our solar system. It has a diameter of only 4,879 kilometers, which is about 38% the size of Earth's diameter.")
        
        Text("Mercury is the closest planet to the sun and has the shortest year of all the planets. One year on Mercury (the time it takes to complete one orbit around the sun) is just 88 Earth days long.")
    }
}

struct Mercury_Preview: PreviewProvider {
    static var previews: some View {
        Mercury()
    }
}
