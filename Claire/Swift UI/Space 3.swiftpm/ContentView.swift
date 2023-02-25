import SwiftUI

struct ContentView: View {
    let planets = ["Mars","Jupiter", "Mercury", "Moon", "Neptune", "Pluto", "Saturn", "Sun", "Uranus", "Venus"]
    @State var number = 1
    var body: some View {
        VStack{
            PlanetView(plantName: planets[number])
            HStack{
                Button("0") { 
                    number = 0
                }
                .buttonStyle(.borderedProminent)
                Button("1") { 
                    number = 1
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }

}
