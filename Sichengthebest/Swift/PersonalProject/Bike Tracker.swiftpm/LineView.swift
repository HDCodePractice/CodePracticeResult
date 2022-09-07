import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    let lineAnnotations: [AnnotationItem]
    let region: MKCoordinateRegion
    let ended: Bool
    var lineCoordinates: [CLLocationCoordinate2D] {
        var tempCoords: [CLLocationCoordinate2D] = []
        for annotation in lineAnnotations {
            tempCoords.append(annotation.coordinate)
        }
        return tempCoords
    }
    
    
    // Create the MKMapView using UIKit.
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.setRegion(region, animated: true)
        mapView.showsUserLocation = true
        let polyline = MKPolyline(coordinates: lineCoordinates, count: lineCoordinates.count)
        mapView.addOverlay(polyline)
        return mapView
    }
    
    // We DO need to worry about this as the view WILL be updated.
    func updateUIView(_ view: MKMapView, context: Context) {
        let polyline = MKPolyline(coordinates: lineCoordinates, count: lineCoordinates.count)
        view.addOverlay(polyline)
        if !ended {
            let overlays = view.overlays 
            for overlay in overlays {
                // remove all MKPolyline-Overlays
                if overlay is MKPolyline {
                    view.removeOverlay(overlay)
                }
            }
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
