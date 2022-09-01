import SwiftUI
import CoreLocation
import MapKit

class LocationManager: NSObject,ObservableObject{
    static let shared = LocationManager()
    static let DefaultLocation = CLLocationCoordinate2D(latitude: 43.919284,longitude: -79.4366317)
    static var currentLocation: CLLocationCoordinate2D {
        guard let location = shared.manager.location else {
            return DefaultLocation
            
        }
        return location.coordinate
    }
    var placeList: [AnnotationItem] = []
    var totalDistance: Double = 0
    var currentSpeed: Double = 0
    
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
            if placeList.count > 0 {
                if let placeListLast = placeList.last {
                    currentSpeed = location.speed
                    let twodLocation: CLLocationCoordinate2D = location.coordinate
                    if checkCloseCoord(coord1: location.coordinate, coord2: placeListLast.coordinate) {
                        placeList.append(AnnotationItem(coordinate: location.coordinate, color: .blue))
                        totalDistance += calculateDistance(alat: placeListLast.coordinate.latitude, along: placeListLast.coordinate.longitude, blat: twodLocation.latitude, blong: twodLocation.longitude)
                        print(placeListLast,placeList.last as Any)
                    }
                }
            } else {
                placeList.append(AnnotationItem(coordinate: location.coordinate, color: .green))
            }
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
    if longDif < 0.001 || latDif < 0.001 {
        return false
    } else {
        return true
    }
}

func calculateDistance(alat: Double, along: Double, blat: Double, blong: Double) -> Double {
    let distance = CLLocation(latitude: alat,longitude: along).distance(from: CLLocation(latitude: blat,longitude: blong))
    return distance
}
