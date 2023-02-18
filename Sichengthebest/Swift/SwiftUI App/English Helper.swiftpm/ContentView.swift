import SwiftUI

struct QuestionView: View {
    @State var vm = ViewModule(question: "cheek",answers: [Answer(image: "https://raw.githubusercontent.com/HDCodePractice/EnglishHelper/main/res/pictures/People/Adults%20and%20Children/old.jpg", isCorrect: false),Answer(image: "https://raw.githubusercontent.com/HDCodePractice/EnglishHelper/main/res/pictures/People/Adults%20and%20Children/male.jpg", isCorrect: true),Answer(image: "https://raw.githubusercontent.com/HDCodePractice/EnglishHelper/main/res/pictures/People/Adults%20and%20Children/middle%20age.jpg", isCorrect: true)])
    var body: some View {
        VStack{
            Text(vm.question)
            HStack{
                ForEach(vm.answers){answer in
                    AsyncImage(url: URL(string: answer.image)){ image in
                        image
                            .resizable()
                            .scaledToFit()
                    }placeholder: {
                        ProgressView()
                    }
                }
            }
        }
    }
}
