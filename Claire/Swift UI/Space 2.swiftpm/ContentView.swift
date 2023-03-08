import SwiftUI

struct ContentView: View {
    let planets = ["Mars","Jupiter", "Mercury", "Moon", "Neptune", "Pluto", "Saturn", "Sun", "Uranus", "Venus"]
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
                    number = 2
                }
                .padding()
                .background(.blue)
                .clipShape(Capsule())
                Button("Mercury") {
                    number = 3
                }
                .padding()
                .background(.blue)
                .clipShape(Capsule())
                Button("Neptune") {
                    destination = "Moon"
                }
                .padding()
                .background(.blue)
                .clipShape(Capsule())
                Button("Pluto") {
                    destination = "Pluto"
                }
                .padding()
                .background(.blue)
                .clipShape(Capsule())
                Button("Saturn") {
                    destination = "Moon"
                }
                .padding()
                .background(.blue)
                .clipShape(Capsule())
                Button("Sun") {
                    destination = "Sun"
                }
                .padding()
                .background(.blue)
                .clipShape(Capsule())
                Button("Uranus") {
                    destination = "Uranus"
                }
                .padding()
                .background(.blue)
                .clipShape(Capsule())
            }
            }
        }
    }

}
