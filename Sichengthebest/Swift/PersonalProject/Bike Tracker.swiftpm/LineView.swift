import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    var lineCoordinates: [CLLocationCoordinate2D]
    var region2 = MKCoordinateRegion(center: LocationManager.shared.currentLocation, span: MKCoordinateSpan(
        latitudeDelta: 0.05, longitudeDelta: 0.05
    ))
    let started: Bool
    let followLocation: Bool
    var isFirst: Bool
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        
        init(parent: MapView) {
            self.parent = parent
        }
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = .blue
            renderer.lineWidth = 5
            return renderer
        }
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            parent.region2 = mapView.region
        }
    }

    class LandmarkAnnotation: NSObject, MKAnnotation {
        let coordinate: CLLocationCoordinate2D
        init(coordinate: CLLocationCoordinate2D) {
            self.coordinate = coordinate
        }
    }
    
    // Create the MKMapView using UIKit
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.showsUserLocation = true
        return mapView
    }
    
    // Updates the view every time a new coordinate is added in placeList
    func updateUIView(_ view: MKMapView, context: Context) {
        if followLocation {
            if isFirst {
                view.region = region2
            }
            view.region.center = region2.center
        }
        let polyline = MKPolyline(coordinates: lineCoordinates, count: lineCoordinates.count)
        view.removeOverlays(view.overlays)
        view.addOverlay(polyline)
    }
    
    // Link it to the coordinator which is defined below.
    func makeCoordinator() -> Coordinator {
        Coordinator(parent:self)
    }
    
}
