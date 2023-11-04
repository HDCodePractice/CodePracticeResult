//
//  ContentView.swift
//  Bike Tracker App
//
//  Created by Sicheng Jiang on 2023-09-09.
//

import SwiftUI
import MapKit

struct WorkoutView: View {
    @State var position: MapCameraPosition = .automatic
    @State var route: MKRoute?
    @State var isStarted = false
    @State var isRunning = false
    @State var satellite = false
    @State var progressTime = 0
    @State var distance = 0.0
    @ObservedObject var lm = LocationManager()
    @State var userCoordinates: [CLLocationCoordinate2D] = []
    
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    let timerWorkout = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Spacer()
            Label("\(Stopwatch(progressTime: progressTime))", systemImage: "stopwatch")
            Label("Distance: \(String(format: "%.2f",distance/1000)) km",systemImage: "figure.outdoor.cycle")
            if progressTime == 0 {
                Label("Avg. Speed: 0.0 kph",systemImage: "speedometer")
            } else {
                Label("Avg. Speed: \(String(format: "%.1f",(distance / Double(progressTime))*3.6)) kph",systemImage: "speedometer")
            }
            HStack {
                    MapCompass()
                    MapPitchToggle()
                    Button {
                        satellite.toggle()
                    } label: {
                        Label(satellite ? "Standard":"Satellite",systemImage: "globe")
                    }
            }
            Map(position:$position) {
                if position.positionedByUser == true || position == .automatic {
                    Annotation("Your location", coordinate: lm.currentLocation ?? CLLocationCoordinate2D(latitude: 45, longitude: -100)) {
                        ZStack {
                            Circle()
                                .fill(.white)
                            Image(systemName: "bicycle.circle.fill")
                                .foregroundColor(.blue)
                        }
                    }
                    .annotationTitles(.hidden)
                }
                MapPolyline(coordinates: userCoordinates)
                    .stroke(.blue, lineWidth: 5)
            }
            .mapStyle(satellite ? .hybrid(elevation: .realistic) : .standard(elevation: .realistic))
            .mapControls() {
                MapUserLocationButton()
            }
            .onAppear() {
//                getDirections()
                position = .userLocation(fallback: .automatic)
            }
            .padding(.bottom)
            WorkoutButtons(
                isStarted: $isStarted,
                isRunning: $isRunning,
                userCoordinates: $userCoordinates,
                progressTime: $progressTime,
                distance: $distance)
            .padding()
        }
        .onReceive(timer) { _ in
            if isRunning {
                userCoordinates.append(lm.currentLocation ?? CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0))
                if userCoordinates.count > 1 {
                    distance += calculateDistance(alat: Double(userCoordinates[userCoordinates.count-1].latitude), along: Double(userCoordinates[userCoordinates.count-1].longitude), blat: Double(userCoordinates[userCoordinates.count-2].latitude), blong: Double(userCoordinates[userCoordinates.count-2].longitude))
                }
            }
        }
        .onReceive(timerWorkout) { _ in
            if isRunning {
                progressTime += 1
            }
        }
    }
    
//    func getDirections() {
//        route = nil
//        
//        let request = MKDirections.Request()
//        request.source = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 32.995940, longitude: -115.586640)))
//        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 33.074877, longitude: -115.741818)))
//        
//        Task {
//            let directions = MKDirections(request: request)
//            let response = try? await directions.calculate()
//            route = response?.routes.first
//        }
//        
//    }
}
