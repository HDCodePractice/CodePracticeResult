import SwiftUI

struct Questions: View {
    let questions = ["What is your lifestyle like?","What size dog are you looking for?","Do you have any previous experience with dog ownership?","Do you have any other pets or children in the household?","Do you prefer a high energy or low energy dog?","How much room do you have for a dog?","Are you willing to train a dog, or do you prefer a dog that is easy to train?","What is your budget for pet care?","Do you have any specific breed preferences or requirements?"]
    let questionChoices = [["Active","Outdoor","Indoor","Lazy"],["Small","Medium","Large"],["Yes","No"],["Children","Pets","None"],["High Energy","Low Energy"],["Lots of room","Small Room", "Some room"],["I can train a dog","I want one easy to train"],["$20,000","$10,000","$15,000","$40,000"],["Hypoallergenic","Quiet","Loud","Low-Shedding"]]
    var responses = [""]
    var dog = ""
    let customColor = Color(red: 0.5, green: 0.2, blue: 0.8)
    var body: some View {
        VStack{
            ZStack{
                Color.customColor
                Text("\(questions[0])")
                    .font(.system(size: 40, design: .rounded))
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(.black) 
            }
            .frame(width: 300, height: 150)
            .cornerRadius(20)
            
        }
        
    }
}

struct Questions_Previews: PreviewProvider {
    static var previews: some View {
        Questions()
    }
}


