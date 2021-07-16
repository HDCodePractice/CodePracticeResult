
import SwiftUI

public struct ContentView : View {
    public init(){}
    public var body : some View {
        List {
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
        }
    }
}

public struct ContentView2: View {
    public init(){}
    public var body : some View {
        LandmarkList()
    }
}
