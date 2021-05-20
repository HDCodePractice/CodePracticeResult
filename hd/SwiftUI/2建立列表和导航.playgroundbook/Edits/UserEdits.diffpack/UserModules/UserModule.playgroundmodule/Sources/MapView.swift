/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 A view that presents a map.
 */

import SwiftUI
import MapKit

public struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    
    public init(){}
    public var body: some View {
        Map(coordinateRegion: $region)
    }
}

public struct MapView2: View {
    var coordinate: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion()
    
    public init(coordinate: CLLocationCoordinate2D){
        self.coordinate = coordinate
    }
    
    public var body: some View {
        Map(coordinateRegion: $region)
            .onAppear{
                setRegion(coordinate)
            }
    }
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}
