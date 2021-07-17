import SwiftUI

public struct ContentView: View {
    public init(){}
    public var body: some View {
        VStack {
            MapView()
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                
                HStack {
                    Text("Joshua Tree National Park")
                    Spacer()
                    Text("California")
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About Turtle Rock")
                    .font(.title2)
                Text("Descriptive text goes here.")
            }
            .padding()
            
            Spacer()
        }
    }
}

public struct ContentView2: View {
    public init() {}
    public var body: some View {
        VStack {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
            LandmarkRow(landmark: landmarks[2])
            LandmarkRow(landmark: landmarks[3])
            LandmarkRow(landmark: landmarks[4])
            LandmarkRow(landmark: landmarks[5])
            LandmarkRow(landmark: landmarks[6])
            LandmarkRow(landmark: landmarks[7])
            LandmarkRow(landmark: landmarks[8])
            LandmarkRow(landmark: landmarks[9])
//              LandmarkRow(landmark: landmarks[10])
//              LandmarkRow(landmark: landmarks[11])
        }
        
    }
}

public struct ContentView3: View {
    public init() {}
    public var body: some View {
        LandmarkList()
    }
}

public struct ContentView4: View {
    public init() {}
    public var body: some View {
        LandmarkList2()
    }
}

public struct ContentView5: View {
    public init() {}
    public var body: some View {
        LandmarkList3()
    }
}


