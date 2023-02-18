import SwiftUI
import MapKit

struct NotMovingMapView: UIViewRepresentable {
    var lineCoordinates: [CLLocationCoordinate2D]
    var region: MKCoordinateRegion
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: NotMovingMapView
        
        init(parent: NotMovingMapView) {
            self.parent = parent
        }
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = .blue
            renderer.lineWidth = 5
            return renderer
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
        let mapView2 = MKMapView()
        mapView2.delegate = context.coordinator
        mapView2.showsUserLocation = true
        mapView2.setRegion(region, animated: true)
        let start = LandmarkAnnotation(coordinate:lineCoordinates[0])
        let end = LandmarkAnnotation(coordinate:lineCoordinates[lineCoordinates.count-1])
        mapView2.addAnnotation(start)
        mapView2.addAnnotation(end)
        let polyline = MKPolyline(coordinates: lineCoordinates, count: lineCoordinates.count)
        mapView2.addOverlay(polyline)
        mapView2.setVisibleMapRect(polyline.boundingMapRect, edgePadding: UIEdgeInsets(top:50,left:50,bottom: 50,right:50), animated: true)
        return mapView2
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        
    }
    
    // Link it to the coordinator which is defined below.
    func makeCoordinator() -> Coordinator {
        Coordinator(parent:self)
    }
    
}
