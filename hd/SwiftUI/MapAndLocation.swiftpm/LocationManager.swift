import CoreLocation

class LocationManager: NSObject,ObservableObject{
    static let shared = LocationManager()
    static let DefaultLocation = CLLocationCoordinate2D(latitude: 37.330828,longitude: -122.007495)
    static var currentLocation: CLLocationCoordinate2D {
        guard let location = shared.locationManager.location else {
            return DefaultLocation
            
        }
        return location.coordinate
    }
    
    private let locationManager = CLLocationManager()
    
    override init(){
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            print(location)
        }
    }
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location manager failed with error: \(error.localizedDescription)")
    }  
    
    public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("Location manager changed the status: \(status)")
    }
}
