import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    var lineCoordinates: [CLLocationCoordinate2D]
    let beforePauses: [Bool]
    var region: MKCoordinateRegion
    let ended: Bool
    
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
    //    func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
    //        parent.region = mapView.region
    //    }
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
        mapView.setRegion(region, animated: true)
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
        if ended {
            view.region.center = region.center
        } else {
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
