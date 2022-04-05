import SwiftUI

struct QuestionView : View {
    @State var vm = ViewModule(question: "cheek",answers: [Answer(image: "https://raw.githubusercontent.com/HDCodePractice/EnglishHelper/main/res/pictures/People/Adults%20and%20Children/old.jpg", isCorrect: false),Answer(image: "https://raw.githubusercontent.com/HDCodePractice/EnglishHelper/main/res/pictures/People/Adults%20and%20Children/male.jpg", isCorrect: true),Answer(image: "https://raw.githubusercontent.com/HDCodePractice/EnglishHelper/main/res/pictures/People/Adults%20and%20Children/middle%20age.jpg", isCorrect: true)])
    
    var body: some View{
        VStack{
            Text(vm.question)
                .font(.largeTitle)
            HStack{
                ForEach(vm.answers){answer in
                    AnswerItem(answer: answer)
                }
            }
        }
    }
}

struct AnswerItem: View {
    @State var answer : Answer
    var body: some View{
        ZStack{
            AsyncImage(url: URL(string: answer.image)){ image in
                image
                    .resizable()
                    .scaledToFit()
            }placeholder: {
                ProgressView()
            }
            if answer.isSelected {
                Image(systemName: answer.isCorrect ? "checkmark.circle.fill" : "x.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .foregroundColor(answer.isCorrect ? .green : .red)
                    .opacity(0.5)
                
            }
        }
        .shadow(radius: 20)
        .onTapGesture {
            answer.isSelected = true
        }
    }
}
