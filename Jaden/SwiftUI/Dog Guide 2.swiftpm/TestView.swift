import SwiftUI

struct Questions: View {
    let questions = ["What is your lifestyle like?","What size dog are you looking for?","Do you have any previous experience with dog ownership?","Do you have any other pets or children in the household?","Do you prefer a high energy or low energy dog?","How much room do you have for a dog?","Are you willing to train a dog, or do you prefer a dog that is easy to train?","What is your budget for pet care?","Do you have any specific breed preferences or requirements?"]
    let questionChoices = [["Active","Outdoor","Indoor","Lazy"],["Small","Medium","Large"],["Yes","No"],["Children","Pets","None"],["High Energy","Low Energy"],["Lots of room","Small Room", "Some room"],["I can train a dog","I want one easy to train"],["$20,000","$10,000","$15,000","$40,000"],["Hypoallergenic","Quiet","Loud","Low-Shedding"]]
    @State var responses : [String] = []
    @State var dog = ""
    @State var a = 0
    var body: some View {
        VStack{
            if a <= 8{
                ZStack{
                    Color(red: 0, green: 0.8, blue: 0.6)
                    Text("\(questions[a])")
                        .font(.system(size: 40, design: .rounded))
                        .bold()
                        .font(.largeTitle)
                        .foregroundColor(.black) 
                }
                .frame(width: 500, height: 200)
                .cornerRadius(20)
            }else{
                ZStack{
                    Color(red: 0, green: 0.8, blue: 0.6)
                    Text("The dog best fit for you is \(dog)")
                        .font(.system(size: 40, design: .rounded))
                        .bold()
                        .font(.largeTitle)
                        .foregroundColor(.black) 
                }
                .frame(width: 370, height: 200)
                .cornerRadius(20)
            }
            if a <= 8{
                ForEach(0...questionChoices[a].count-1,id:\.self){ i in
                    
                    ZStack{
                        Color(red: 0, green: 0.8, blue: 0.6)
                        Text("\(questionChoices[a][i])")
                            .font(.system(size: 40, design: .rounded))
                            .bold()
                            .font(.largeTitle)
                            .foregroundColor(.black)
                        
                    }
                    .frame(width: 300, height: 150)
                    .cornerRadius(20)
                    .onTapGesture {
                        withAnimation{
                            responses.append(questionChoices[a][i])
                            print(responses)
                            if a < 8{
                                a += 1
                            }else{
                                a = 9 
                            }
                        }
                        
                        
                    }
                    
                }
            }else{
                Button() {
                    
                } label: {
                    ZStack {
                        Color(red: 0, green: 0.8, blue: 0.6)
                        Text("Home")
                            .font(.system(size: 40, design: .rounded))
                            .bold()
                            .foregroundColor(.black)
                            .font(.title)
                    }
                    .frame(width: 300, height: 100)
                    .cornerRadius(20)
                    
                }
            }

            
        }
        
    }
}

struct Questions_Previews: PreviewProvider {
    static var previews: some View {
        Questions()
    }
}


