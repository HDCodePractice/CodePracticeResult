import SwiftUI
import MapKit


// Now using LineView.swift
struct ShowAnnotationItem: View {
    @State var vm = showAnnotationViewItemsViewModel()
    var annotations : [AnnotationItem]
    
    var body: some View {
        Map(coordinateRegion: $vm.region, annotationItems: annotations) { item in
            //MapMarker(coordinate: item.coordinate,tint:item.color)
            MapAnnotation(coordinate: item.coordinate) { 
                Image(systemName: "bicycle.circle.fill")
                    .foregroundColor(item.color)
            }
        }
    }
}

struct ShowAnnotationItem_Previews: PreviewProvider {
    static var previews: some View {
        ShowAnnotationItem(annotations: [AnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 43.91402248496052, longitude: -79.44344087901682), color: .blue)])
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
