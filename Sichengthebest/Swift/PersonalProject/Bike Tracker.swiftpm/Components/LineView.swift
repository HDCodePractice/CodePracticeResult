import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    let lineCoordinates: [CLLocationCoordinate2D]
    let beforePauses: [Bool]
    let region: MKCoordinateRegion
    let ended: Bool
    
    // Create the MKMapView using UIKit
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.setRegion(region, animated: true)
        mapView.showsUserLocation = true
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
            let polyline = MKPolyline(coordinates: lineCoordinates, count: lineCoordinates.count)
            view.removeOverlays(view.overlays)
            view.addOverlay(polyline)
        }
    }
    
    // Link it to the coordinator which is defined below.
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
}

class Coordinator: NSObject, MKMapViewDelegate {
    var parent: MapView
    
    init(_ parent: MapView) {
        self.parent = parent
    }
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let routePolyline = overlay as? MKPolyline {
            let renderer = MKPolylineRenderer(polyline: routePolyline)
            renderer.strokeColor = UIColor.systemBlue
            renderer.lineWidth = 5
            return renderer
        }
        return MKOverlayRenderer()
    }
}

class LandmarkAnnotation: NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}
