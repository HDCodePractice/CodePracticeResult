import SwiftUI
import MapKit

extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else {
            return nil
        }
        self = result
    }
    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data:data,encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}

struct Workout: Codable,Identifiable {
    var id = UUID()
    var time: Int
    var date: Date
    var speed: Double
    var distance: Double
    var coordArray: [[Double]] = []
    var coordinates: [CLLocationCoordinate2D] {
        return coordArray.map({x in CLLocationCoordinate2D(latitude: x[0], longitude: x[1])})
    }
    mutating func addCoordToArray(coord:CLLocationCoordinate2D) {
        coordArray.append([coord.latitude,coord.longitude])
    }
}
