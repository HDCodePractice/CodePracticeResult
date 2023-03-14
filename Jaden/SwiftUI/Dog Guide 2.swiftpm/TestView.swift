import SwiftUI

struct Dogs{
    var names = ["Labrador Retriever",
                 "German Shepherd",
                 "Golden Retriever",
                 "Bulldog",
                 "Beagle",
                 "Poodle",
                 "Labradoodle",
                 "Siberian Husky",
                 "Dachshund",
                 "Corgi",
                 "Shih Tzu",
                 "Great Dane",
                 "Border Collie",
                 "Chihuahua",
                 "Yorkshire Terrier",
                 "Rottweilers",
                 "Shiba Inu",
                 "Golden Doodle",
                 "Maltese",
                 "Australian Shepherd"]
    var scores : [Int] = []
    
    init(){
        for _ in names{
            scores.append(0)
        }
    }
}



struct Questions: View {
    let questions = ["What is your lifestyle like?","What size dog are you looking for?","Do you have any previous experience with dog ownership?","Do you have any other pets or children in the household?","Do you prefer a high energy or low energy dog?","How much room do you have for a dog?","Are you willing to train a dog, or do you prefer a dog that is easy to train?","What is your budget for pet care?","Do you have any specific breed preferences or requirements?"]
    let questionChoices = [["Active","Outdoor","Indoor","Lazy"],["Small","Medium","Large"],["Yes","No"],["Children","Pets","None"],["High Energy","Low Energy"],["Lots of room","Small Room", "Some room"],["I can train a dog","I want one easy to train"],["$10,000","$15,000","$20,000","$40,000"],["Hypoallergenic","Quiet","Protective","Low-Shedding"]]
    var dogscore = [[[4, 3, 4, 2, 3, 3, 3, 4, 3, 2, 2, 1, 4, 2, 1, 1, 2, 1, 1, 4],[4,4,4,2,3,2,1,4,3,3,1,1,3,2,2,2,3,1,1,4],[2, 2, 2, 4, 2, 4, 3, 2, 3, 3, 4, 1, 1, 4, 3, 1, 1, 3, 4, 1],[1,2,1,3,2,2,2,1,2,3,3,4,1,3,4,4,3,4,4,1]],[[2, 2, 2, 3, 3, 3, 3, 1, 4, 3, 4, 1, 1, 4, 4, 2, 1, 1, 4, 2], [4,4,4,3,3,3,3,3,2,2,2,1,4,1,1,2,1,2,1,4], [3,3,3,2,2,2,2,4,1,2,1,4,4,1,1,3,4,4,1,3,]], [[4,4,4,3,3,4,2,3,2,3,2,2,4,1,1,2,1,1,1,3],[1,1,1,2,2,1,3,2,3,2,3,3,1,4,4,3,4,4,4,2]],[[4, 4, 3, 3, 4, 3, 2, 2, 2, 3, 4, 4, 2, 1, 2, 3, 1, 1, 1, 1], [4,2,4,4,4,4,1,2,3,3,3,2,3,1,2,2,1,1,1,3], [4,4,4,3,1,3,1,3,3,3,2,1,4,1,2,3,2,1,2,4]], [[3,3,4,4,3,3,4,4,2,2,1,2,4,1,1,2,2,1,1,4], [3,1,3,3,2,3,2,1,4,4,4,2,2,4,3,1,1,1,1,4,2]], [[4,4,4,3,2,2,3,4,1,2,1,4,3,1,1,3,2,2,1,3],[1,1,1,3,3,3,2,1,4,3,4,1,2,4,4,2,3,2,3,2],[4,4,4,3,2,2,3,4,1,2,1,4,3,1,1,3,2,2,1,3]],[[4,4,4,2,2,4,3,2,3,3,2,2,4,1,1,3,2,3,2,4],[4,4,4,3,3,4,3,3,3,3,3,2,4,2,2,3,3,3,2,4]],[[4,4,4,3,3,3,3,3,2,2,2,2,4,1,1,1,1,1,1,1,4],[4,4,4,3,3,3,3,3,2,2,2,2,4,2,1,1,1,1,1,1,4],[4,4,4,3,3,3,3,3,2,2,2,2,4,2,1,1,1,1,1,1,4],[3,3,4,4,2,2,4,4,2,2,3,4,1,2,3,1,1,1,1,3,1]],[[2,3,3,1,2,4,4,3,2,2,4,1,2,1,4,1,1,3,3,4,3],[4,3,2,3,4,3,1,1,2,2,3,4,4,2,1,2,1,1,4,3],[4,3,4,3,4,3,2,1,2,3,2,4,2,1,2,4,1,1,3,1],[1,1,1,3,3,4,4,2,2,2,4,2,4,4,4,2,3,4,4,2]]]
    @State var responses : [String] = []
    @State var dog = ""
    @State var a = 0
    @State var dogs = Dogs()
    @State var largest = 0
    @State var dogSpot = 0
    func addScore(questionNumber: Int, choiceNumber : Int){
        
        for i in 0..<dogs.names.count {
            dogs.scores[i] += dogscore[questionNumber][choiceNumber][i]
        }
        print(dogs.scores)
    }

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
                            addScore(questionNumber: a, choiceNumber: i)
                            
                            if a < 8{
                                a += 1
                            }else{
                                a = 9
                                for i in dogs.scores{
                                    if i > largest{
                                        largest = i
                                    }
                                }
                                for i in 0..<dogs.scores.count{
                                    if dogs.scores[i] == largest{
                                        dogSpot = i
                                    }
                                }
                                dog = dogs.names[dogSpot]
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


