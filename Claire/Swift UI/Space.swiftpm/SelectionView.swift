import SwiftUI

struct Select: View {
    @State var destination : String = ""
    @State var distance : Int = 0
    var body: some View {
        VStack{
            Button("Moon") {
                destination = "Moon"
                distance = 
            }
            .padding()
            .background(.blue)
            .clipShape(Capsule())
            Button("Jupiter") {
                destination = "Jupiter"
            }
            .padding()
            .background(.blue)
            .clipShape(Capsule())
            Button("Mars") {
                destination = "Mars"
            }
            .padding()
            .background(.blue)
            .clipShape(Capsule())
            Button("Mercury") {
                destination = "Mercury"
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

struct Select_Previews: PreviewProvider {
    static var previews: some View {
        Select()
    }
}
