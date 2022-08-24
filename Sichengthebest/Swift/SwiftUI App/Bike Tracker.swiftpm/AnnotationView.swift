import SwiftUI
import MapKit

struct ShowAnnotationItem: View {
    @State var vm = showAnnotationViewItemsViewModel()
    
    var body: some View {
        Map(coordinateRegion: $vm.region, annotationItems: vm.annotationItems) { item in
            //MapMarker(coordinate: item.coordinate,tint:item.color)
            MapAnnotation(coordinate: item.coordinate) { 
                Image(systemName: "bicycle.circle.fill")
                    .foregroundColor(item.color)
            }
        }
        let _ = print(vm.annotationItems)
    }
}

struct ShowAnnotationItem_Previews: PreviewProvider {
    static var previews: some View {
        ShowAnnotationItem()
    }
}

struct AnnotationItem:Identifiable {
    let id = UUID()
    var coordinate: CLLocationCoordinate2D
    var color: Color
}

struct showAnnotationViewItemsViewModel {
    @StateObject var lm = LocationManager.shared
    @State var region = MKCoordinateRegion(
        center: LocationManager.currentLocation, span: MKCoordinateSpan(
            latitudeDelta: 0.05, longitudeDelta: 0.05
        )
    )
    var annotationItems = LocationManager.shared.placeList
}
