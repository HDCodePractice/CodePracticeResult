import SwiftUI
import MapKit

struct ShowMapView: View {
    @State var coordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 37.330828, 
            longitude: -122.007495), 
        span: MKCoordinateSpan(
            latitudeDelta: 0.02, 
            longitudeDelta: 0.02)
    )
    
    var body: some View {
        Map(
            coordinateRegion: $coordinateRegion ,
            showsUserLocation: true
        )
    }
}

struct ShowMapView_Previews: PreviewProvider {
    static var previews: some View {
        ShowMapView()
    }
}
