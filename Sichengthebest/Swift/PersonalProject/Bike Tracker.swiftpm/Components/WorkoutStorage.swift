import SwiftUI
import MapKit

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

extension CLLocationCoordinate2D: Hashable,Equatable {
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        return lhs.latitude == rhs.latitude  &&
        lhs.longitude == rhs.longitude
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(longitude)
        hasher.combine(latitude)
    }
}

struct Workout: Codable,Identifiable {
    var id = UUID()
    var time: Int
    var date: Date
    var speed: Double
    var distance: Double
    var beforePauses: [Bool]
    var coordArray: [[Double]] = []
    var coordinates: [CLLocationCoordinate2D] {
        return coordArray.map({x in CLLocationCoordinate2D(latitude: x[0], longitude: x[1])})
    }
    mutating func addCoordToArray(coord:CLLocationCoordinate2D) {
        coordArray.append([coord.latitude,coord.longitude])
    }
}

struct Annotation: Identifiable,Hashable {
    var id = UUID()
    var coordinate: CLLocationCoordinate2D
    var beforePause: Bool
}
