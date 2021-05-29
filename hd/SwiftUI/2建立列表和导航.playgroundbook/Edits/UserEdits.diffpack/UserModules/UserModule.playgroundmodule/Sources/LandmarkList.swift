
import SwiftUI

public struct LandmarkList1: View {
    public init(){}
    public var body: some View {
        List {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
    }
}

public struct LandmarkList: View {
    public init(){}
    public var body: some View {
        List (landmarks){ landmark in
            LandmarkRow(landmark: landmark)
        }
    }
}

public struct LandmarkList2: View {
    public init(){}
    public var body: some View {
        NavigationView{
            List (landmarks){ landmark in
                NavigationLink(destination: LandmarkDetail2(landmark: landmark)){
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}
