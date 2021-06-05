import SwiftUI
import MapKit
import PlaygroundSupport

public struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    public init(){}
    public var body: some View{
        Map(coordinateRegion: $region)
    }
}
