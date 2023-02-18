import Foundation
import SwiftUI

struct Country: Identifiable {
    let id : UUID = UUID()
    var capitalName:String
    var countryName:String
    var flag:String
}
