import SwiftUI
import MapKit

struct ShowAnnotationItemsView: View {
    @State var vm = ShowAnnotationItemsViewModel()
    
    var body: some View {
        Map(coordinateRegion: $vm.region, 
            annotationItems: vm.annotationItems) { item in
            // MapMarker(coordinate: item.coordinate, tint: item.color)
            MapAnnotation(coordinate: item.coordinate) { 
                Image(systemName: "bicycle.circle.fill")
                    .foregroundColor(item.color)
            }
        }
    }
}

struct AnnotationItem:Identifiable{
    let id = UUID()
    var coordinate: CLLocationCoordinate2D
    var color : Color
}

struct ShowAnnotationItemsViewModel{
    let annotationItems = [
        AnnotationItem(coordinate: CLLocationCoordinate2D(
            latitude: 37.330828,
            longitude: -122.007495),
                       color: .blue),
        AnnotationItem(coordinate: CLLocationCoordinate2D(
            latitude: 37.336083,
            longitude: -122.007356),
                       color: .yellow),
        AnnotationItem(coordinate: CLLocationCoordinate2D(
            latitude: 37.336901,
            longitude: -122.012345),
                       color: .yellow),
    ]
    var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 37.330828,
            longitude: -122.007495),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
}

struct ShowAnnotationItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ShowAnnotationItemsView()
    }
}
