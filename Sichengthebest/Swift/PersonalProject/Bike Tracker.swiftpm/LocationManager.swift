import SwiftUI
import CoreLocation
import MapKit

class LocationManager: NSObject,ObservableObject{
    static let shared = LocationManager()
    static let DefaultLocation = CLLocationCoordinate2D(latitude: 43.919284,longitude: -79.4366317)
    @Published var currentLocation: CLLocationCoordinate2D = DefaultLocation
    @Published var currentRegion = MKCoordinateRegion(
        center: DefaultLocation, span: MKCoordinateSpan(
            latitudeDelta: 0.05, longitudeDelta: 0.05
        ))
    @Published var placeList: [Annotation] = []
    var prevElevation: Double = 0
    var totalDistance: Double = 0
    var currentSpeed: Double = 0
    var elevationGain: Double = 0
    var isFirst: Bool = true
    @Published var isRunning = false
    @Published var isStarted = false
    
    private let manager = CLLocationManager()
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            currentLocation = location.coordinate
            if placeList.count > 0 {
                // checks whether placeList is empty
                if let placeListLast = placeList.last {
                    // creates placeListLast to circumvent bugs
                    currentSpeed = location.speed
                    currentRegion.center = location.coordinate
                    if checkCloseCoord(coord1: location.coordinate, coord2: placeListLast.coordinate) {
                        if isRunning {
                            totalDistance += calculateDistance(alat: placeListLast.coordinate.latitude, along: placeListLast.coordinate.longitude, blat: location.coordinate.latitude, blong: location.coordinate.longitude)
                            if isFirst {
                                prevElevation = location.altitude
                                isFirst = false
                            }
                            if prevElevation <= location.altitude {
                                elevationGain += location.altitude - prevElevation
                            }
                            prevElevation = location.altitude
                            placeList.append(Annotation(coordinate:location.coordinate,distanceAt: totalDistance,time: Date.now))
                        }
                    }
                }
            } else {
                // if placeList is empty, appends current location by default
                if isStarted {
                    prevElevation = location.altitude
                    placeList.append(Annotation(coordinate:location.coordinate,distanceAt: totalDistance,time: Date.now))
                }
            }
        }
    }
    // error messages
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location manager failed with error: \(error.localizedDescription)")
    }  
    
    public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("Location manager changed the status: \(status)")
    }
}

// checks whether a certain coordinate is too close to the last one in placeList
func checkCloseCoord(coord1:CLLocationCoordinate2D, coord2:CLLocationCoordinate2D) -> Bool {
    let longDif = abs(coord1.longitude-coord2.longitude)
    let latDif = abs(coord1.latitude-coord2.latitude)
    if longDif + latDif < 0.0003 {
        return false
    } else {
        return true
    }
}

// calculates distance between 2 coordinates
func calculateDistance(alat: Double, along: Double, blat: Double, blong: Double) -> Double {
    let distance = CLLocation(latitude: alat,longitude: along).distance(from: CLLocation(latitude: blat,longitude: blong))
    return distance
}
