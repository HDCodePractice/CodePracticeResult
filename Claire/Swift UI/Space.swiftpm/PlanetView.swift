import SwiftUI

struct PlanetView: View {
    var body: some View {
        Image(planetName)
            .resizable()
            .scaledToFit()
            .border(.red, width: 5)
    }
}

struct PlanetView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetView(plantName: "Earth")
    }
}
