import SwiftUI

struct PlanetView: View {
    var plantName : String
    var body: some View {
        Image(plantName)
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
