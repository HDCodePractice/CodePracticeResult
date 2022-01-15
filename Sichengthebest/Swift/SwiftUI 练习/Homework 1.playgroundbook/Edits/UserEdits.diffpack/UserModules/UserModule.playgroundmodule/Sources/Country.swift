
import Foundation
import SwiftUI

struct Country: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var yes: String
    var no: [String]
    var haha: [String]
}
