import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    let lineCoordinates: [CLLocationCoordinate2D]
    let region: MKCoordinateRegion
    let ended: Bool
    
    // Create the MKMapView using UIKit
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.setRegion(region, animated: true)
        mapView.showsUserLocation = true
        var tempCoords: [CLLocationCoordinate2D] = []
        for coord in lineCoordinates {
            tempCoords.append(coord)
        }
        tempCoords.append(LocationManager.currentLocation)
        let polyline = MKPolyline(coordinates: tempCoords, count: lineCoordinates.count)
        mapView.addOverlay(polyline)
        if ended {
            let start = LandmarkAnnotation(coordinate:lineCoordinates[0],imageName: "start")
            let end = LandmarkAnnotation(coordinate:lineCoordinates[lineCoordinates.count-1],imageName: "end")
            mapView.addAnnotation(start)
            mapView.addAnnotation(end)
        }
        return mapView
    }
    
    // Updates the view every time a new coordinate is added in placeList
    func updateUIView(_ view: MKMapView, context: Context) {
        var tempCoords: [CLLocationCoordinate2D] = []
        for coord in lineCoordinates {
            tempCoords.append(coord)
        }
        tempCoords.append(LocationManager.currentLocation)
        let polyline = MKPolyline(coordinates: tempCoords, count: lineCoordinates.count)
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

class LandmarkAnnotation: NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    let imageName: String
    init(coordinate: CLLocationCoordinate2D, imageName:String) {
        self.coordinate = coordinate
        self.imageName = imageName
    }
}
