
import Foundation
import SwiftUI

struct Pokemon: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var type: [String]
    var description: String
    var height: String
    var weight: String
    var abilities: [String]
    var hiddenabilities: [String]
    var hp: Int
    var atk: Int
    var def: Int
    var spatk: Int
    var spdef: Int
    var speed: Int
    var total: Int
    var isFavorite: Bool
    var image: Image {
        Image(uiImage: UIImage(named:"\(id).jpg")!)
    }
}
