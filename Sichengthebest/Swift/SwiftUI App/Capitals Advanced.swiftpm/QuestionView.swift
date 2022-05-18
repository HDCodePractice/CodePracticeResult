import SwiftUI

struct QuestionView:View {
    var flagImage: String
    
    var body: some View {
        VStack {
            Image(flagImage)
                .resizable()
                .scaledToFit()
                .padding()
            HStack {
                AnswerButton(name: "Beaconsfield", isRight: true, isClick: false)
                AnswerButton(name: "SL", isRight: true, isClick: false)
            }
            HStack {
                AnswerButton(name: "d", isRight: true, isClick: false)
                AnswerButton(name: "Beaconsfieldasdfadfasfasfsafasfasfasfasfasf", isRight: true, isClick: false)
            }
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(flagImage: "canada")
    }
}
