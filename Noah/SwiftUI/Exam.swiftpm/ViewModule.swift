import SwiftUI

struct ViewModule {
    var question: String
    var answers: [Answer]
}

struct Answer: Identifiable {
    let id = UUID()
    var image: String
    var isCorrect: Bool
    var isSelected: Bool = false
}
