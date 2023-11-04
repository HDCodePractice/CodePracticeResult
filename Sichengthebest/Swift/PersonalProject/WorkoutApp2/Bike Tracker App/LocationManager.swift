//
//  LocationManager.swift
//  Bike Tracker App
//
//  Created by Sicheng Jiang on 2023-09-30.
//

import SwiftUI
import CoreLocation
import MapKit

class LocationManager: NSObject,ObservableObject, CLLocationManagerDelegate{
    static let DefaultLocation = CLLocationCoordinate2D(latitude: 43.919284,longitude: -79.4366317)
    @Published var currentLocation: CLLocationCoordinate2D?
    @Published var currentRegion = MKCoordinateRegion(
        center: DefaultLocation, span: MKCoordinateSpan(
            latitudeDelta: 0.05, longitudeDelta: 0.05
        ))
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
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            currentLocation = location.coordinate
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
