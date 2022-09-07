import SwiftUI
import MapKit

struct ShowMap: View {
    @State var coordinates = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 45.4046, longitude: -73.8955), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    var body: some View {
        Map(coordinateRegion: $coordinates,showsUserLocation: true)
    }
}

struct ShowMap_Previews: PreviewProvider {
    static var previews: some View {
        ShowMap()
    }
}
