import SwiftUI

struct Questions: View {
    let questions = ["What is your lifestyle like?","What size dog are you looking for?","Do you have any previous experience with dog ownership?","Do you have any other pets or children in the household?","Do you prefer a high energy or low energy dog?","How much room do you have for a dog?","Are you willing to train a dog, or do you prefer a dog that is easy to train?","What is your budget for pet care?","Do you have any specific breed preferences or requirements?"]
    let questionChoices = [["Active","Outdoor","Indoor","Lazy"],["Small","Medium","Large"],["Yes","No"],["Children","Pets","None"],["High Energy","Low Energy"],["Lots of room","Small Room", "Some room"],["I can train a dog","I want one easy to train"],["$20,000","$10,000","$15,000","$40,000"],["Hypoallergenic","Quiet","Loud","Low-Shedding"]]
    @State var responses : [String] = []
    @State var dog = ""
    @State var a = 0
    @State var labradorretriever = 0
    @State var germanshepherd = 0
    @State var goldenretriever = 0
    @State var bulldog = 0
    @State var beagle = 0
    @State var poodle = 0
    @State var labradoodle = 0
    @State var siberianhusky = 0
    @State var dachshund = 0
    @State var corgi = 0
    @State var shihtzu = 0
    @State var greatdane = 0
    @State var  bordercollie = 0
    @State var  chihuahua = 0
    @State var  yorkshireterrier = 0
    @State var  rottweilers = 0
    @State var shibainu = 0
    @State var goldendoodle = 0
    @State var maltese = 0
    @State var australianshepherd = 0
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
                            if a == 0 && i == 0{
                                labradorretriever += 4
                                germanshepherd += 3
                                goldenretriever += 4
                                bulldog += 2
                                beagle += 3
                                poodle += 3
                                labradoodle += 3
                                siberianhusky += 4
                                dachshund += 3
                                corgi += 2
                                shihtzu += 2
                                greatdane += 1
                                bordercollie += 4
                                chihuahua += 2
                                yorkshireterrier += 1
                                rottweilers += 1
                                shibainu += 2
                                goldendoodle += 1
                                maltese += 1
                                australianshepherd += 4
                            }else if a == 0 && i == 1{
                                labradorretriever += 4
                                germanshepherd += 4
                                goldenretriever += 4
                                bulldog += 2
                                beagle += 3
                                poodle += 2
                                labradoodle += 1
                                siberianhusky += 4
                                dachshund += 3
                                corgi += 3
                                shihtzu += 1
                                greatdane += 1
                                bordercollie += 3
                                chihuahua += 2
                                yorkshireterrier += 2
                                rottweilers += 2
                                shibainu += 3
                                goldendoodle += 1
                                maltese += 1
                                australianshepherd += 4
                            }else if a == 0 && i == 2{
                                labradorretriever += 2
                                germanshepherd += 2
                                goldenretriever += 2
                                bulldog += 4
                                beagle += 2
                                poodle += 4
                                labradoodle += 3
                                siberianhusky += 2
                                dachshund += 3
                                corgi += 3
                                shihtzu += 4
                                greatdane += 1
                                bordercollie += 1
                                chihuahua += 4
                                yorkshireterrier += 3
                                rottweilers += 1
                                shibainu += 1
                                goldendoodle += 3
                                maltese += 4
                                australianshepherd += 1
                            }else if a == 0 && i == 3{
                                labradorretriever += 1
                                germanshepherd += 2
                                goldenretriever += 1
                                bulldog += 3
                                beagle += 2
                                poodle += 2
                                labradoodle += 2
                                siberianhusky += 1
                                dachshund += 2
                                corgi += 3
                                shihtzu += 3
                                greatdane += 4
                                bordercollie += 1
                                chihuahua += 3
                                yorkshireterrier += 4
                                rottweilers += 4
                                shibainu += 3
                                goldendoodle += 4
                                maltese += 4
                                australianshepherd += 1
                            }else if a == 1 && i == 0{
                                labradorretriever += 2
                                germanshepherd += 2
                                goldenretriever += 2
                                bulldog += 3
                                beagle += 3
                                poodle += 3
                                labradoodle += 3
                                siberianhusky += 1
                                dachshund += 4
                                corgi += 3
                                shihtzu += 4
                                greatdane += 1
                                bordercollie += 1
                                chihuahua += 4
                                yorkshireterrier += 4
                                rottweilers += 2
                                shibainu += 1
                                goldendoodle += 1
                                maltese += 4
                                australianshepherd += 2
                            }else if a == 1 && i == 1{
                                labradorretriever += 4
                                germanshepherd += 4
                                goldenretriever += 4
                                bulldog += 3
                                beagle += 3
                                poodle += 3
                                labradoodle += 3
                                siberianhusky += 3
                                dachshund += 2
                                corgi += 2
                                shihtzu += 2
                                greatdane += 1
                                bordercollie += 4
                                chihuahua += 1
                                yorkshireterrier += 1
                                rottweilers += 2
                                shibainu += 1
                                goldendoodle += 2
                                maltese += 1
                                australianshepherd += 4
                            }else if a == 1 && i == 2{
                                labradorretriever += 3
                                germanshepherd += 3
                                goldenretriever += 3
                                bulldog += 2
                                beagle += 2
                                poodle += 2
                                labradoodle += 2
                                siberianhusky += 4
                                dachshund += 1
                                corgi += 2
                                shihtzu += 1
                                greatdane += 4
                                bordercollie += 4
                                chihuahua += 1
                                yorkshireterrier += 1
                                rottweilers += 3
                                shibainu += 4
                                goldendoodle += 4
                                maltese += 1
                                australianshepherd += 3
                            }else if a == 2 && i == 0{
                                labradorretriever += 4
                                germanshepherd += 4
                                goldenretriever += 4
                                bulldog += 3
                                beagle += 3
                                poodle += 4
                                labradoodle += 2
                                siberianhusky += 3
                                dachshund += 2
                                corgi += 3
                                shihtzu += 2
                                greatdane += 2
                                bordercollie += 4
                                chihuahua += 1
                                yorkshireterrier += 1
                                rottweilers += 2
                                shibainu += 1
                                goldendoodle += 1
                                maltese += 1
                                australianshepherd += 3
                            }else if a == 2 && i == 1{
                                labradorretriever += 1
                                germanshepherd += 1
                                goldenretriever += 1
                                bulldog += 2
                                beagle += 2
                                poodle += 1
                                labradoodle += 3
                                siberianhusky += 2
                                dachshund += 3
                                corgi += 2
                                shihtzu += 3
                                greatdane += 3
                                bordercollie += 1
                                chihuahua += 4
                                yorkshireterrier += 4
                                rottweilers += 3
                                shibainu += 4
                                goldendoodle += 4
                                maltese += 4
                            }else if a == 3 && i == 0{
                                labradorretriever+=4
                                goldenretriever+=4
                                bulldog+=3
                                beagle+=3
                                poodle+=4
                                corgi+=3
                                greatdane+=2
                                australianshepherd+=2
                                siberianhusky+=2
                                dachshund+=3
                                bordercollie+=4
                                germanshepherd+=4
                                labradoodle+=2
                                yorkshireterrier+=1
                                rottweilers+=2
                                shihtzu+=3
                                shibainu+=1
                                goldendoodle+=1
                                chihuahua+=1
                                maltese+=1
                            }else if a == 3 && i == 1{
                                labradorretriever+=4
                                goldenretriever+=4
                                beagle+=3
                                bulldog+=3
                                poodle+=3
                                corgi+=3
                                dachshund+=2
                                shihtzu+=2
                                australianshepherd+=2
                                bordercollie+=3
                                greatdane+=1
                                germanshepherd+=2
                                rottweilers+=2
                                siberianhusky+=2
                                yorkshireterrier+=1
                                chihuahua+=1
                                shibainu+=1
                                labradoodle+=1
                                goldendoodle+=1
                                maltese+=1
                            }else if a == 3 && i == 2{
                                germanshepherd += 4
                                bordercollie += 4
                                labradorretriever += 4
                                goldenretriever += 4
                                australianshepherd += 4
                                siberianhusky += 3
                                bulldog += 3
                                corgi += 3
                                rottweilers += 3
                                poodle += 3
                                dachshund += 3
                                shihtzu += 2
                                yorkshireterrier += 2
                                maltese += 2
                                shibainu += 2
                                greatdane += 1
                                beagle += 1
                                labradoodle += 1
                                goldendoodle += 1
                                chihuahua += 1
                            }else if a == 4 && i == 0{
                                bordercollie += 4
                                australianshepherd += 4
                                siberianhusky += 4
                                goldenretriever += 4
                                labradoodle += 4
                                labradorretriever += 3
                                germanshepherd += 3
                                poodle += 3
                                bulldog += 3
                                beagle += 3
                                shibainu += 2
                                greatdane += 2
                                corgi += 2
                                rottweilers += 2
                                dachshund += 2
                                yorkshireterrier += 1
                                maltese += 1
                                chihuahua += 1
                                shihtzu += 1
                                bulldog += 1
                            }else if a == 4 && i == 1{
                                labradorretriever += 4
                                germanshepherd += 3
                                goldenretriever += 4
                                bulldog += 2
                                beagle += 3
                                poodle += 3
                                labradoodle += 3
                                siberianhusky += 4
                                dachshund += 3
                                corgi += 2
                                shihtzu += 2
                                greatdane += 1
                                bordercollie += 4
                                chihuahua += 2
                                yorkshireterrier += 1
                                rottweilers += 1
                                shibainu += 2
                                goldendoodle += 1
                                maltese += 1
                                australianshepherd += 4
                            }else if a == 5 && i == 0{
                                labradorretriever += 4
                                germanshepherd += 3
                                goldenretriever += 4
                                bulldog += 2
                                beagle += 3
                                poodle += 3
                                labradoodle += 3
                                siberianhusky += 4
                                dachshund += 3
                                corgi += 2
                                shihtzu += 2
                                greatdane += 1
                                bordercollie += 4
                                chihuahua += 2
                                yorkshireterrier += 1
                                rottweilers += 1
                                shibainu += 2
                                goldendoodle += 1
                                maltese += 1
                                australianshepherd += 4
                            }else if a == 5 && i == 1{
                                labradorretriever += 4
                                germanshepherd += 3
                                goldenretriever += 4
                                bulldog += 2
                                beagle += 3
                                poodle += 3
                                labradoodle += 3
                                siberianhusky += 4
                                dachshund += 3
                                corgi += 2
                                shihtzu += 2
                                greatdane += 1
                                bordercollie += 4
                                chihuahua += 2
                                yorkshireterrier += 1
                                rottweilers += 1
                                shibainu += 2
                                goldendoodle += 1
                                maltese += 1
                                australianshepherd += 4
                            }else if a == 5 && i == 2{
                                labradorretriever += 4
                                germanshepherd += 3
                                goldenretriever += 4
                                bulldog += 2
                                beagle += 3
                                poodle += 3
                                labradoodle += 3
                                siberianhusky += 4
                                dachshund += 3
                                corgi += 2
                                shihtzu += 2
                                greatdane += 1
                                bordercollie += 4
                                chihuahua += 2
                                yorkshireterrier += 1
                                rottweilers += 1
                                shibainu += 2
                                goldendoodle += 1
                                maltese += 1
                                australianshepherd += 4
                            }else if a == 6 && i == 0{
                                labradorretriever += 4
                                germanshepherd += 3
                                goldenretriever += 4
                                bulldog += 2
                                beagle += 3
                                poodle += 3
                                labradoodle += 3
                                siberianhusky += 4
                                dachshund += 3
                                corgi += 2
                                shihtzu += 2
                                greatdane += 1
                                bordercollie += 4
                                chihuahua += 2
                                yorkshireterrier += 1
                                rottweilers += 1
                                shibainu += 2
                                goldendoodle += 1
                                maltese += 1
                                australianshepherd += 4
                            }else if a == 6 && i == 1{
                                labradorretriever += 4
                                germanshepherd += 3
                                goldenretriever += 4
                                bulldog += 2
                                beagle += 3
                                poodle += 3
                                labradoodle += 3
                                siberianhusky += 4
                                dachshund += 3
                                corgi += 2
                                shihtzu += 2
                                greatdane += 1
                                bordercollie += 4
                                chihuahua += 2
                                yorkshireterrier += 1
                                rottweilers += 1
                                shibainu += 2
                                goldendoodle += 1
                                maltese += 1
                                australianshepherd += 4
                            }else if a == 7 && i == 0{
                                labradorretriever += 4
                                germanshepherd += 3
                                goldenretriever += 4
                                bulldog += 2
                                beagle += 3
                                poodle += 3
                                labradoodle += 3
                                siberianhusky += 4
                                dachshund += 3
                                corgi += 2
                                shihtzu += 2
                                greatdane += 1
                                bordercollie += 4
                                chihuahua += 2
                                yorkshireterrier += 1
                                rottweilers += 1
                                shibainu += 2
                                goldendoodle += 1
                                maltese += 1
                                australianshepherd += 4
                            }else if a == 7 && i == 1{
                                labradorretriever += 4
                                germanshepherd += 3
                                goldenretriever += 4
                                bulldog += 2
                                beagle += 3
                                poodle += 3
                                labradoodle += 3
                                siberianhusky += 4
                                dachshund += 3
                                corgi += 2
                                shihtzu += 2
                                greatdane += 1
                                bordercollie += 4
                                chihuahua += 2
                                yorkshireterrier += 1
                                rottweilers += 1
                                shibainu += 2
                                goldendoodle += 1
                                maltese += 1
                                australianshepherd += 4
                            }else if a == 7 && i == 2{
                                labradorretriever += 4
                                germanshepherd += 3
                                goldenretriever += 4
                                bulldog += 2
                                beagle += 3
                                poodle += 3
                                labradoodle += 3
                                siberianhusky += 4
                                dachshund += 3
                                corgi += 2
                                shihtzu += 2
                                greatdane += 1
                                bordercollie += 4
                                chihuahua += 2
                                yorkshireterrier += 1
                                rottweilers += 1
                                shibainu += 2
                                goldendoodle += 1
                                maltese += 1
                                australianshepherd += 4
                            }else if a == 7 && i == 3{
                                labradorretriever += 4
                                germanshepherd += 3
                                goldenretriever += 4
                                bulldog += 2
                                beagle += 3
                                poodle += 3
                                labradoodle += 3
                                siberianhusky += 4
                                dachshund += 3
                                corgi += 2
                                shihtzu += 2
                                greatdane += 1
                                bordercollie += 4
                                chihuahua += 2
                                yorkshireterrier += 1
                                rottweilers += 1
                                shibainu += 2
                                goldendoodle += 1
                                maltese += 1
                                australianshepherd += 4
                            }else if a == 8 && i == 0{
                                labradorretriever += 4
                                germanshepherd += 3
                                goldenretriever += 4
                                bulldog += 2
                                beagle += 3
                                poodle += 3
                                labradoodle += 3
                                siberianhusky += 4
                                dachshund += 3
                                corgi += 2
                                shihtzu += 2
                                greatdane += 1
                                bordercollie += 4
                                chihuahua += 2
                                yorkshireterrier += 1
                                rottweilers += 1
                                shibainu += 2
                                goldendoodle += 1
                                maltese += 1
                                australianshepherd += 4
                            }else if a == 8 && i == 1{
                                labradorretriever += 4
                                germanshepherd += 3
                                goldenretriever += 4
                                bulldog += 2
                                beagle += 3
                                poodle += 3
                                labradoodle += 3
                                siberianhusky += 4
                                dachshund += 3
                                corgi += 2
                                shihtzu += 2
                                greatdane += 1
                                bordercollie += 4
                                chihuahua += 2
                                yorkshireterrier += 1
                                rottweilers += 1
                                shibainu += 2
                                goldendoodle += 1
                                maltese += 1
                                australianshepherd += 4
                            }else if a == 8 && i == 2{
                                labradorretriever += 4
                                germanshepherd += 3
                                goldenretriever += 4
                                bulldog += 2
                                beagle += 3
                                poodle += 3
                                labradoodle += 3
                                siberianhusky += 4
                                dachshund += 3
                                corgi += 2
                                shihtzu += 2
                                greatdane += 1
                                bordercollie += 4
                                chihuahua += 2
                                yorkshireterrier += 1
                                rottweilers += 1
                                shibainu += 2
                                goldendoodle += 1
                                maltese += 1
                                australianshepherd += 4
                            }else if a == 8 && i == 3{
                                labradorretriever += 4
                                germanshepherd += 3
                                goldenretriever += 4
                                bulldog += 2
                                beagle += 3
                                poodle += 3
                                labradoodle += 3
                                siberianhusky += 4
                                dachshund += 3
                                corgi += 2
                                shihtzu += 2
                                greatdane += 1
                                bordercollie += 4
                                chihuahua += 2
                                yorkshireterrier += 1
                                rottweilers += 1
                                shibainu += 2
                                goldendoodle += 1
                                maltese += 1
                                australianshepherd += 4
                            }
                            
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


