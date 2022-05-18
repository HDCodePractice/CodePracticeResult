import SwiftUI

struct AnswerButton:View {
    var name: String
    var isRight: Bool
    var isClick: Bool
    
    var body: some View {
        VStack {
            ZStack {
                Text(name)
                    .font(.system(size: 20))
                    .lineLimit(1)
                    .minimumScaleFactor(0.01)
                    .frame(maxWidth:.infinity)
                    .frame(maxHeight:.infinity)
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(.blue)
                    .cornerRadius(30)
                    .shadow(color:isClick ? isRight ? .green : .red : .clear, radius: 10)
                Image(systemName: isRight ? "checkmark.circle.fill" : "x.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(isClick ? isRight ? .green : .red : .clear)
                    .opacity(0.8)
            }
            
        }
    }
}

struct AnswerButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing:30) {
            AnswerButton(name: "Beaconsfield",isRight: true,isClick: false)
                .previewDevice("iPhone 12 mini")
            AnswerButton(name: "Beaconsfield",isRight: false,isClick: true)
        }
        .previewDevice("iPhone 12 mini")
    }
}
