import SwiftUI

public struct ContentView: View {
    public init(){}
    public var body: some View {
        CircleImage()
    }
}

public struct ContentView5: View {
    public init(){}
    public var body: some View {
        MapView()
    }
}

public struct ContentView6: View {
    public init(){}
    public var body: some View {
        VStack {
            MapView()
                .frame(height:450)
            CircleImage()
                .offset(y: -100)
                .padding(.bottom, -220)
            VStack {
                Text("Turtle Rock")
                    .font(.title)
                    .foregroundColor(Color(#colorLiteral(red: 0.9977119565, green: 0.7947712541, blue: 0.2450369, alpha: 1.0)))
                HStack {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                        .foregroundColor(Color(#colorLiteral(red: 0.9977119565, green: 0.7947712541, blue: 0.2450369, alpha: 1.0)))
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                        .foregroundColor(Color(#colorLiteral(red: 0.9977119565, green: 0.7947712541, blue: 0.2450369, alpha: 1.0)))
                }
                Divider()
                
                Text("About Turtle Rock")
                    .font(.title2)
                    .foregroundColor(Color(#colorLiteral(red: 0.9977119565, green: 0.7947712541, blue: 0.2450369, alpha: 1.0)))
                Text("A rock that looks like a turtle.")
                    .foregroundColor(Color(#colorLiteral(red: 0.9977119565, green: 0.7947712541, blue: 0.2450369, alpha: 1.0)))
            }
            .padding(150)
        }
    }
}

