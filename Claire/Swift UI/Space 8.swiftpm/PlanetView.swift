import SwiftUI

struct PlanetView: View {
    var planetName : String
    var body: some View {
        Image(planetName)
            .resizable()
            .scaledToFit()
            .border(.red, width: 5)
        
        if planetName == "JupiterView"{
            ZStack{
                Image(planetName)
                    .resizable()
                    .scaledToFit()
                    .border(.red, width: 5)
                Jupiter()
            }
            
        } else if planetName == "MarsView"{
            ZStack{
                Image(planetName)
                    .resizable()
                    .scaledToFit()
                    .border(.red, width: 5)
                Mars()
            }
        } else if planetName == "MercuryView"{
            ZStack{
                Image(planetName)
                    .resizable()
                    .scaledToFit()
                    .border(.red, width: 5)
                Mercury()
            }
        } else if planetName == "MoonView"{
            ZStack{
                Image(planetName)
                    .resizable()
                    .scaledToFit()
                    .border(.red, width: 5)
                Moon()
            }
        } else if planetName == "NeptuneView"{
            ZStack{
                Image(planetName)
                    .resizable()
                    .scaledToFit()
                    .border(.red, width: 5)
                Neptune()
            }
        } else if planetName == "PlutoView"{
            ZStack{
                Image(planetName)
                    .resizable()
                    .scaledToFit()
                    .border(.red, width: 5)
                Plato()
            }
        } else if planetName == "SaturnView"{
            ZStack{
                Image(planetName)
                    .resizable()
                    .scaledToFit()
                    .border(.red, width: 5)
                Saturn()
            }
        } else if planetName == "UranusView"{
            ZStack{
                Image(planetName)
                    .resizable()
                    .scaledToFit()
                    .border(.red, width: 5)
                Uranus()
            }
        } else if planetName == "VenusView"{
            ZStack{
                Image(planetName)
                    .resizable()
                    .scaledToFit()
                    .border(.red, width: 5)
                Venus()
            }
        }
        
    }
}

struct PlanetView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetView(planetName: "EarthView")
    }
}
