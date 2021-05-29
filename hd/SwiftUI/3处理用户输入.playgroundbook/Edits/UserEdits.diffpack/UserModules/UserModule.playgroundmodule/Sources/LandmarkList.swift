
import SwiftUI

public struct LandmarkList: View {
    public init(){}
    public var body: some View {
        NavigationView{
            List (landmarks){ landmark in
                NavigationLink(destination: LandmarkDetail(landmark: landmark)){
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

public struct LandmarkList2: View {
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    public init(){}
    public var body: some View {
        NavigationView{
            List (filteredLandmarks){ landmark in
                NavigationLink(destination: LandmarkDetail(landmark: landmark)){
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

public struct LandmarkList3: View {
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    public init(){}
    public var body: some View {
        NavigationView{
            List {
                Toggle(isOn: $showFavoritesOnly){
                    Text("Favorites only")
                }
                ForEach(filteredLandmarks){ landmark in
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)){
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

public struct LandmarkList4: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    public init(){}
    public var body: some View {
        NavigationView{
            List {
                Toggle(isOn: $showFavoritesOnly){
                    Text("Favorites only")
                }
                ForEach(filteredLandmarks){ landmark in
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)){
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

public struct LandmarkList5: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    public init(){}
    public var body: some View {
        NavigationView{
            List {
                Toggle(isOn: $showFavoritesOnly){
                    Text("Favorites only")
                }
                ForEach(filteredLandmarks){ landmark in
                    NavigationLink(destination: LandmarkDetail2(landmark: landmark)){
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}
