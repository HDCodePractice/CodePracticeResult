
import Foundation
import SwiftUI

struct Star: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var points: [[CGFloat]]
    var isFavorite: Bool
}
