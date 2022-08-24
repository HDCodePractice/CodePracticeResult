import SwiftUI
import CoreLocation
import MapKit

class LocationManager: NSObject,ObservableObject{
    static let shared = LocationManager()
    static let DefaultLocation = CLLocationCoordinate2D(latitude: 37.330828,longitude: -122.007495)
    static var currentLocation: CLLocationCoordinate2D {
        guard let location = shared.manager.location else {
            return DefaultLocation
            
        }
        return location.coordinate
    }
    var placeList: [AnnotationItem] = []
    
    private let manager = CLLocationManager()
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            placeList.append(AnnotationItem(coordinate: location.coordinate, color: .green))
        }
    }
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location manager failed with error: \(error.localizedDescription)")
    }  
    
    public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("Location manager changed the status: \(status)")
    }
}

func checkCloseCoord(coord1:CLLocationCoordinate2D, coord2:CLLocationCoordinate2D) -> Bool {
    let longDif = abs(coord1.longitude-coord2.longitude)
    let latDif = abs(coord1.latitude-coord2.latitude)
    if longDif < 0.0001 || latDif < 0.0001 {
        return false
    } else {
        return true
    }
}
