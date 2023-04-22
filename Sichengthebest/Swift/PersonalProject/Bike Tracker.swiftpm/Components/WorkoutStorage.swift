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
    var endDate: Date
    var speed: Double
    var distance: Double
    var elevationGain: Double
    var coordArray: [[Double]] = []
    var distances: [Double] {
        return coordArray.map({x in x[2]})
    }
    var startDate: Date {
        return Calendar.current.date(byAdding: .second, value: -(time), to: endDate)!
    }
    var coordinates: [CLLocationCoordinate2D] {
        return coordArray.map({x in CLLocationCoordinate2D(latitude: x[0], longitude: x[1])})
    }
    var coordinates2: [[CLLocationCoordinate2D]] {
        var count = 0
        var distanceCount = 0
        var betterArray: [[CLLocationCoordinate2D]] = []
        for distance in distances {
            if Int(distance/1000) == distanceCount {
                if betterArray.count <= distanceCount {
                    betterArray.append([])
                }
                betterArray[distanceCount].append(coordinates[count])
            } else {
                distanceCount += 1
            }
            if count < coordinates.count-1 {
                count += 1
            }
        }
        return betterArray
    }
    var dates: [Date] = []
    var times: [[Date]] {
        var count2 = 0
        var distanceCount2 = 0
        var betterArray2: [[Date]] = []
        for distance in distances {
            if Int(distance/1000) == distanceCount2 {
                if betterArray2.count <= distanceCount2 {
                    betterArray2.append([])
                }
                betterArray2[distanceCount2].append(dates[count2])
            } else {
                distanceCount2 += 1
            }
            if count2 < dates.count-1 {
                count2 += 1
            }
        }
        return betterArray2
    }
    mutating func addCoordToArray(coord:CLLocationCoordinate2D,distance:Double) {
        coordArray.append([coord.latitude,coord.longitude,distance])
    }
    
    mutating func addTimeToArray(time:Date) {
        dates.append(time)
    }
}

struct Annotation: Identifiable,Hashable {
    var id = UUID()
    var coordinate: CLLocationCoordinate2D
    var distanceAt: Double
    var time: Date
}

