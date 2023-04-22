import SwiftUI

struct ContentView: View {
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

struct HomeView: View{
    var body: some View{
        ZStack{
            Color.black
            ZStack{
                Image("Jupiter")
                    .resizable()
                    .frame(width: 450, height: 450)
                    .offset(y: -200)
//                Image("Saturn")
//                    .resizable()
//                    .frame(width: 400, height: 400)
//                    .offset(y: -150)
                Image("Uranus")
                    .resizable()
                    .frame(width: 320, height: 320)
                    .offset(y: -100)
                    .shadow(radius: 20)
                Image("Neptune")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .offset(y: 0)
                    .shadow(radius: 20)
                Image("Earth")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .offset(y: 70)
                    .shadow(radius: 20)
                Image("Venus")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .offset(y: 140)
                    .shadow(radius: 20)
                Image("Mars")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .offset(y: 190)
                    .shadow(radius: 20)
                Image("Mercury")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .offset(y: 240)
                    .shadow(radius: 20)
            }
            
            Button {
                
            } label: {
                ZStack{
                    Color.white
                    Text("Start")
                        .font(.headline)
                        .foregroundColor(.black)
                }
                .frame(width: 300, height: 50)
                .cornerRadius(100)
                .shadow(radius: 5)
            }
            .offset(y: 325)
        }
        .ignoresSafeArea()
    }
}
