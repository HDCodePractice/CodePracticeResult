import MapKit
import SwiftUI

public struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
        span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
    )
    public var body: some View {
        Map(coordinateRegion: $region)
    }
}
