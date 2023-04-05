import SwiftUI

struct Venus: View {
    var body: some View {
        Text("Venus is the hottest planet in our solar system, with a surface temperature that can reach up to 864 degrees Fahrenheit (462 degrees Celsius). This extreme heat is due to a thick atmosphere made up mostly of carbon dioxide, which traps heat from the sun and creates a runaway greenhouse effect.")
        
        Text("Venus rotates very slowly, taking about 243 Earth days to complete one full rotation on its axis. However, interestingly enough, Venus's day (the time it takes for one full rotation relative to the sun) is actually shorter than its year (the time it takes to complete one orbit around the sun). Venus's year is about 225 Earth days long, which means that a year on Venus is shorter than a day!")
    }
}

struct Venus_Preview: PreviewProvider {
    static var previews: some View {
        Venus()
    }
}
