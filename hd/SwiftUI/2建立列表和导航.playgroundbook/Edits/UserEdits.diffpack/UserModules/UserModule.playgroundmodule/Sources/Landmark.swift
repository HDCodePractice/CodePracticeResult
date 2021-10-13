import Foundation
import SwiftUI
import CoreLocation

public struct Landmark: Hashable, Codable, Identifiable {
    public var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    private var imageName: String
    public var image: Image{
        Image(uiImage: UIImage(named: "\(imageName)@2x.jpg")!)
    }
    
    private var coordinates: Coordinates
    public var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
