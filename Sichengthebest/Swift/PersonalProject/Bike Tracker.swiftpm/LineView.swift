import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    var lineCoordinates: [CLLocationCoordinate2D]
    let beforePauses: [Bool]
    @Binding var region: MKCoordinateRegion
    let ended: Bool
    
    // Create the MKMapView using UIKit
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        let polyline = MKPolyline(coordinates: lineCoordinates, count: lineCoordinates.count)
        mapView.delegate = context.coordinator
        mapView.setRegion(region, animated: true)
        mapView.showsUserLocation = true
//        mapView.removeOverlays(mapView.overlays)
//        mapView.addOverlay(polyline)
        if ended {
            let start = LandmarkAnnotation(coordinate:lineCoordinates[0])
            let end = LandmarkAnnotation(coordinate:lineCoordinates[lineCoordinates.count-1])
            mapView.addAnnotation(start)
            mapView.addAnnotation(end)
        }
        return mapView
    }
    
    // Updates the view every time a new coordinate is added in placeList
    func updateUIView(_ view: MKMapView, context: Context) {
        if !ended {
            view.region = region
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
        parent.region = mapView.region
    }
}

class LandmarkAnnotation: NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}
