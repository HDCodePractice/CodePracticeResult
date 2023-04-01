import SwiftUI

struct Jupiter: View {
    var body: some View {
        Text("Jupiter is the largest planet in our solar system, with a diameter of about 86,881 miles (139,822 kilometers). That's more than 11 times the diameter of Earth!")
        
        Text("Jupiter has the shortest day of any planet in our solar system, with a rotation period of just 9 hours and 56 minutes. This rapid rotation causes the planet to bulge at the equator and flatten at the poles, giving it a distinct 'squished' appearance.")
    }
}

struct Jupiter_Preview: PreviewProvider {
    static var previews: some View {
        Jupiter()
    }
}
