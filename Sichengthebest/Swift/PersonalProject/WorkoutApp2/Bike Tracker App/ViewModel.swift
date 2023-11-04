//
//  ViewModel.swift
//  Bike Tracker App
//
//  Created by Sicheng Jiang on 2023-10-28.
//

import SwiftUI
import MapKit

struct Workout: Codable,Identifiable,Equatable {
    var id = UUID()
    var time: Int = 0
    var endDate: Date
    var speed: Double = 0.0
    var distance: Double = 0.0
    var elevationGain: Double = 0.0
    var coordArray: [[Double]] = []
    
    mutating func addCoordToArray(coord:CLLocationCoordinate2D) {
        coordArray.append([coord.latitude,coord.longitude])
    }
}

// Makes it possible to store arrays using @AppStorage
extension Array: RawRepresentable where Element: Codable {
    // reads string
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else {
            return nil
        }
        self = result
    }
    // encodes arrays into string
    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data:data,encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}

func calculateDistance(alat: Double, along: Double, blat: Double, blong: Double) -> Double {
    let distance = CLLocation(latitude: alat,longitude: along).distance(from: CLLocation(latitude: blat,longitude: blong))
    return distance
}
