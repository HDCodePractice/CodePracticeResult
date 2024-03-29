import SwiftUI

struct Select: View {
    let planets = ["MarsView","JupiterView", "MercuryView", "MoonView", "NeptuneView", "PlutoView", "SaturnView", "SunView", "UranusView", "VenusView"]
    @State var number = 1
    var body: some View {
        VStack{
            PlanetView(planetName: planets[number])
            HStack{
                Button("Moon") {
                    number = 0
                }
                .padding()
                .background(.blue)
                .clipShape(Capsule())
                Button("Jupiter") {
                    number = 1
                }
                .padding()
                .background(.blue)
                .clipShape(Capsule())
                Button("Mars") {
                    number = 0
                }
                .padding()
                .background(.blue)
                .clipShape(Capsule())
                Button("Mercury") {
                    number = 2
                }
                .padding()
                .background(.blue)
                .clipShape(Capsule())
                Button("Neptune") {
                    number = 6
                }
                .padding()
                .background(.blue)
                .clipShape(Capsule())
                Button("Pluto") {
                    number = 7
                }
                .padding()
                .background(.blue)
                .clipShape(Capsule())
                Button("Saturn") {
                    number = 8
                }
                .padding()
                .background(.blue)
                .clipShape(Capsule())
                Button("Sun") {
                    number = 9
                }
                .padding()
                .background(.blue)
                .clipShape(Capsule())
                Button("Uranus") {
                    number = 10
                }
                .padding()
                .background(.blue)
                .clipShape(Capsule())
                Button("Venus") {
                    number = 11
                }
                .padding()
                .background(.blue)
                .clipShape(Capsule())
            }
        }
    }
}

struct Select_Previews: PreviewProvider {
    static var previews: some View {
        Select()
    }
}
