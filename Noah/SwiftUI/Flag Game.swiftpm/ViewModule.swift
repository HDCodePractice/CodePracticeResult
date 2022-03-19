import SwiftUI

struct ViewModule {
    var images: [String] = []
    var answerChoices: [String] = []
    var correctAnswer = ""
    var cs: [Choices] = []
}

struct Choices: Identifiable {
    let id = UUID()
    var answerSets: [[String]]
    var images: [[String]]
}
