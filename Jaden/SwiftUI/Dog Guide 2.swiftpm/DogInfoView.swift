import SwiftUI

struct DogInfoView: View {
    @State var b = 0
    @State var a = 0
    @State var dog = 0
    var dogs : String
    @State var dogg = 0
    @State private var showingDog = false
    @State private var showingPros = false
    @State private var showingCons = false
    @State private var showingInfo = false
    @State private var showingEssay = false
    let pros = ["Pros","Australian Shepherds, also known as Aussies, are a highly versatile and intelligent breed of dog. One of the most significant advantages of owning an Australian Shepherd is their ability to perform a wide range of tasks, from herding livestock to serving as therapy dogs. They are highly trainable and eager to please, making them an excellent choice for owners who are willing to put in the time and effort to teach them new skills. Additionally, Australian Shepherds are known for their high energy levels, which makes them great companions for active families who enjoy spending time outdoors. They also have a strong protective instinct, which can make them excellent watchdogs. Furthermore, Australian Shepherds are generally healthy and long-lived, with a lifespan of 12-15 years, which means they can provide many years of love and companionship to their owners. Overall, Australian Shepherds are a loyal and intelligent breed that can make great pets for the right owners.","Golden retrievers are a popular breed of dog for many reasons, and there are several benefits to owning one. For starters, they are known for their friendly and affectionate nature, which makes them excellent family pets. They are gentle and patient with children, and they tend to get along well with other dogs and even cats. Golden retrievers are also highly intelligent, making them easy to train and a great choice for first-time dog owners. They are known for their loyalty and devotion to their owners, and they thrive on being a part of a family unit. Additionally, golden retrievers are active dogs that enjoy regular exercise, which can help keep their owners active and healthy as well. Overall, owning a golden retriever can bring a lot of joy and companionship to a household.","German Shepherds are a popular and well-loved breed of dog with many pros to consider. One of the most notable pros is their intelligence and trainability, which makes them a great choice for those seeking a working dog. They are quick learners, obedient, and excel at activities such as agility and tracking. German Shepherds are also fiercely loyal and protective of their owners, making them great guard dogs. They are highly athletic and require plenty of exercise and mental stimulation to stay healthy and happy, which can be a benefit for those with an active lifestyle. Additionally, German Shepherds are a versatile breed that can be trained to do many different tasks, making them suitable for roles such as police or military dogs, therapy dogs, or family pets. With proper care and attention, German Shepherds are generally healthy dogs that can live long, happy lives, forming strong bonds with their owners along the way.","Labradoodles are a popular hybrid dog breed that combines the best traits of two purebred breeds: Labrador Retrievers and Poodles. One of the biggest advantages of owning a Labradoodle is their hypoallergenic coat, which is great for individuals with allergies. Labradoodles are also highly intelligent, making them easy to train and ideal for various activities such as agility, obedience, and therapy work. They are also known for their friendly and affectionate nature, making them excellent family pets. Additionally, Labradoodles are known to be relatively low maintenance when it comes to grooming, with their coats requiring only minimal brushing and grooming to keep them looking great. Overall, the Labradoodle's unique combination of traits make them a great choice for many individuals and families looking for a friendly, intelligent, and hypoallergenic dog."]
    
    let cons = ["Cons","While Australian Shepherds are a beloved breed for many, there are some potential downsides to consider before bringing one into your home. One of the most significant challenges with owning an Australian Shepherd is their high energy level, which can make them difficult to manage if they don't receive enough exercise and mental stimulation. They can become bored and destructive if left alone for long periods or not given enough opportunities to play and work. Additionally, Australian Shepherds have a strong herding instinct, which can lead them to nip at and chase small children or other animals. This can make them unsuitable for families with young children or pets. Australian Shepherds also require regular grooming to maintain their thick coats, which can be time-consuming and expensive. Finally, like many breeds, Australian Shepherds are prone to certain health issues, such as hip dysplasia and epilepsy, which can require ongoing veterinary care. Overall, while Australian Shepherds can be excellent pets for the right owner, it's important to weigh these potential cons against the many positive qualities of the breed before making a decision.","While there are many benefits to owning a golden retriever, there are also some potential drawbacks that prospective owners should consider. One of the biggest challenges with this breed is their high energy level, which can make them difficult to manage if they don't receive enough exercise and stimulation. They can become bored and destructive if left alone for long periods of time, and they may develop behavioral issues if they don't receive proper training and socialization. Golden retrievers are also known for shedding a lot, which means that they require regular grooming to keep their coats looking their best. They are prone to certain health issues, such as hip dysplasia and certain types of cancer, which can be expensive to treat. Additionally, because golden retrievers are such popular dogs, they can be prone to overbreeding and health problems associated with poor breeding practices. Overall, while golden retrievers make wonderful pets for the right families, it's important to be aware of the potential challenges before bringing one into your home.","While German Shepherds are a popular breed with many positive qualities, there are also some cons to consider. One potential downside is their high exercise needs, which can be a challenge for owners who are not able to provide enough physical activity and mental stimulation. Additionally, German Shepherds are prone to certain health issues, which can be costly and time-consuming to manage. Their protective nature can be a double-edged sword as well, as they may exhibit aggression towards strangers or other dogs without proper training and socialization. Shedding is another con to consider, as German Shepherds have a thick coat that requires regular grooming and may be problematic for those with allergies or who prefer a cleaner home. Finally, while they are intelligent and trainable, German Shepherds require consistent and patient training, which can be a challenge for some owners.","While labradoodles are often praised for their hypoallergenic coats and friendly personalities, there are also some potential downsides to consider when deciding whether to bring one into your home. One of the most significant drawbacks of labradoodles is their high energy level, which can make them difficult to manage if they don't receive enough exercise and mental stimulation. They are also prone to separation anxiety, which can lead to destructive behavior if left alone for long periods. Additionally, labradoodles require regular grooming to maintain their coats, which can be time-consuming and expensive. Finally, because labradoodles are a relatively new breed, there is still some variability in their temperament and health, which can make it difficult to predict their long-term behavior and well-being. Overall, while labradoodles can make great pets for the right owner, it's important to weigh these potential cons against the many positive qualities of the breed before making a decision."]
    
    let otherInfo = ["Other Info","Australian Shepherds, commonly known as 'Aussies,' are a medium-sized breed of dog that originated in the western United States. Despite their name, they are not actually from Australia but were developed as working dogs on ranches and farms in the western US. Aussies are known for their intelligence, versatility, and high energy levels, which make them well-suited for a variety of activities, including herding, agility, obedience, and therapy work. They typically have a medium-length, thick coat that can be black, blue merle, red, or red merle in color, with white and/or tan markings. Australian Shepherds are highly trainable and eager to please, making them popular pets for owners who are willing to provide them with the necessary exercise and mental stimulation. They are also known for their loyalty and protective instincts, which can make them excellent watchdogs. However, due to their high energy levels, Aussies require plenty of exercise and attention to prevent destructive behaviors. Additionally, they have a tendency to nip at and herd small children and other animals, which can be problematic for families with young children or pets. With proper training and socialization, Australian Shepherds can be excellent pets for the right owners.","Golden Retrievers are a medium to large-sized breed of dog that originated in Scotland in the mid-19th century. They were originally bred as hunting dogs, specifically for retrieving waterfowl. Golden Retrievers are known for their friendly and outgoing temperament, which makes them excellent family pets. They are also highly intelligent and eager to please, which makes them easy to train. Golden Retrievers are typically medium to dark golden in color, with a thick, wavy coat that sheds heavily. They require regular grooming to keep their coats healthy and shiny. Golden Retrievers are active dogs that require regular exercise and mental stimulation to stay healthy and happy. They are generally healthy dogs, but they can be prone to certain health issues such as hip dysplasia, certain types of cancer, and heart disease. With proper care and attention, a golden retriever can be a wonderful and loyal companion for many years.","German Shepherds are a breed of dog that originated in Germany in the late 19th century. They were originally bred as herding dogs but quickly became popular for their intelligence and trainability. Today, they are one of the most popular dog breeds in the world, and are used for a variety of tasks such as police and military work, search and rescue, therapy work, and as family pets. German Shepherds are a medium to large-sized breed, typically weighing between 50 and 90 pounds. They have a distinctive look, with a thick double coat that is usually black and tan or sable in color. German Shepherds are known for their loyalty and protective nature, making them excellent guard dogs. They are also highly active and require plenty of exercise and mental stimulation to stay healthy and happy. With proper care and attention, German Shepherds can live long, healthy lives and form strong bonds with their owners. However, they do require a lot of training and socialization to ensure that their protective instincts are properly channeled, and their exercise needs can be a challenge for some owners.","Labradoodles are a hybrid breed that was first created in the 1980s by crossing a Labrador Retriever with a Standard Poodle. They were initially bred as hypoallergenic guide dogs, but their friendly personalities and low-shedding coats quickly made them popular as family pets. Labradoodles come in a range of sizes, from miniature to standard, and their coats can be curly, wavy, or straight. They are highly intelligent and trainable, making them well-suited for activities such as obedience, agility, and therapy work. However, labradoodles are also known for their high energy levels, which require plenty of exercise and mental stimulation to keep them happy and healthy. They are typically good with children and other pets, but early socialization is important to ensure they develop appropriate behaviors. While labradoodles are not recognized by the American Kennel Club as a breed, they are recognized by several other organizations and have become increasingly popular in recent years."]
    
    let persuasiveEssay = ["Persuasive Essay","If you're looking for an intelligent, active, and loyal dog, you should consider getting an Australian Shepherd. Here are some reasons why an Australian Shepherd could be the perfect addition to your family:First and foremost, Australian Shepherds are incredibly intelligent dogs. They are quick learners and excel at obedience training, agility, and other dog sports. This means that they are great companions for people who enjoy spending time outdoors and engaging in physical activities.In addition to their intelligence, Australian Shepherds are also very loyal and affectionate. They are known for forming strong bonds with their owners and being fiercely protective of their families. They are great with children and other pets, making them an excellent choice for families. Another great thing about Australian Shepherds is that they are very active dogs. They require plenty of exercise and mental stimulation to stay healthy and happy. They love to play games, go for runs, and explore new places. This means that they are great for people who enjoy an active lifestyle. Australian Shepherds are also known for their beautiful, colorful coats. Their coats come in a range of colors, including black, blue merle, red, and red merle. Their coats require regular grooming, but their unique coloring and patterns make them stand out from other breeds. Finally, Australian Shepherds are generally healthy dogs. They can be prone to certain health issues, but with proper care and attention, they can live long, happy lives. They require a nutritious diet, regular exercise, and plenty of love and attention from their owners. Overall, an Australian Shepherd can bring a lot of joy and companionship into your life. They are intelligent, active, and loyal dogs that are great for families or individuals who enjoy spending time outdoors. If you're looking for a new furry friend, an Australian Shepherd could be the perfect choice for you.","If you're looking for a loyal and affectionate companion, a golden retriever may be the perfect dog for you. Here are some reasons why you should consider getting a golden retriever:First and foremost, golden retrievers are incredibly friendly and outgoing dogs. They love to be around people, and they are great with children and other pets. They are known for their gentle nature and their ability to get along with just about anyone. In addition to their friendly personalities, golden retrievers are also highly intelligent and easy to train. They are eager to please their owners, which makes them excellent dogs for first-time pet owners. With a little bit of patience and consistency, you can train your golden retriever to do just about anything.Golden retrievers are also very active dogs, which means they require plenty of exercise and mental stimulation. If you enjoy spending time outdoors and going for walks or runs, a golden retriever will be the perfect companion for you. They love to play fetch and other games, and they will keep you on your toes.Another great thing about golden retrievers is that they are generally healthy dogs. With proper care and attention, they can live long, happy lives. They do require regular grooming, but their thick, wavy coat is one of their most endearing features. Overall, a golden retriever can bring a lot of joy and companionship into your life. They are loyal, affectionate, and easy to train, making them the perfect choice for families or individuals looking for a new furry friend. So if you're considering getting a dog, why not consider a golden retriever? You won't be disappointed!","Dear Parents, I am writing to you to make a compelling case for why we should consider getting a German Shepherd as our next family pet. I know that we have discussed this topic before, but I hope that I can convince you to see the benefits of owning a German Shepherd. First and foremost, German Shepherds are incredibly intelligent and highly trainable. They are quick learners and can be taught to perform a wide range of tasks, from basic obedience training to more complex tricks and commands. This intelligence makes them a highly adaptable breed that can easily adjust to various lifestyles and environments. Additionally, German Shepherds are known for their fierce loyalty and protective nature. They are naturally inclined to protect their owners, making them an excellent choice for families with children. With a German Shepherd in our home, we can rest easy knowing that we have a loyal and dependable companion watching over us. Furthermore, German Shepherds are highly active and require regular exercise and mental stimulation. As a family, we can benefit greatly from having a pet that encourages us to spend time outdoors and stay active. A German Shepherd can motivate us to explore new places, enjoy long walks, and experience the great outdoors in a way that is both fun and healthy. Lastly, German Shepherds have a long lifespan and can make a lasting impact on our lives. They are known for forming strong bonds with their owners, and their presence can be a source of comfort and companionship for many years to come. In conclusion, owning a German Shepherd can bring numerous benefits to our family. Their intelligence, loyalty, and protective nature make them an ideal pet for families with children, while their need for exercise and mental stimulation can encourage us to lead a healthier lifestyle. I hope that you will consider my request to add a German Shepherd to our family and give us the opportunity to experience the many joys of owning this incredible breed. Thank you for your time and consideration.","Dear Parents,I am writing to express my desire to add a Labradoodle to our family. I understand that adding a pet is a big responsibility, but I believe that a Labradoodle would be the perfect addition to our household for many reasons. Firstly, Labradoodles are known for their friendly and affectionate personalities, making them great family pets. They are also highly intelligent and trainable, which means they can be taught to behave appropriately and fit into our family's routine. As a result, a Labradoodle could help bring our family closer together, providing us with companionship, entertainment, and joy. Secondly, Labradoodles are hypoallergenic, which means they are less likely to cause allergies in people who are sensitive to pet dander. This is important, as it would allow us to enjoy the benefits of having a pet without worrying about allergic reactions. Additionally, Labradoodles are relatively low-shedding, which means that they require less maintenance than other breeds. Finally, I believe that a Labradoodle would be a great way for me to learn important life skills. Caring for a pet requires responsibility, patience, and empathy, all of which are valuable traits that can help me in the future. It would also give me a sense of purpose and something to look forward to, which can be especially helpful during stressful or challenging times. I understand that getting a pet is a big decision, and that there are many factors to consider. However, I hope that you will see the many benefits that a Labradoodle could bring to our family. I am willing to take on the responsibility of caring for our new pet, and I am committed to making sure that he or she is happy, healthy, and well-behaved. Thank you for considering my request, and I hope that you will give it serious thought. Sincerely, [Your Name]"]
    var body: some View {
        if showingDog == false{
            VStack{
                if a == 0{
                    Button() {
                        if dogs == "AustralianShepherd"{
                            dogg = 0
                            dog = 1
                        }else if dogs == "GoldenRetriever"{
                            dogg = 1
                            dog = 2
                        } else if dogs == "GermanShepherd"{
                            dogg = 2
                            dog = 3
                        } else if dogs == "Labradoodle"{
                            dogg = 3
                            dog = 4
                        }
                        a = 1
                    } label: {
                        Image("4")
                        ZStack {
                            
                            Color(red: 0, green: 0.8, blue: 0.6)
                            Text("Start")
                                .font(.system(size: 40, design: .rounded))
                                .bold()
                                .foregroundColor(.black)
                                .font(.title)
                        }
                        .cornerRadius(20)
                        .padding()
                        
                    }
                }else if a == 1{
                    VStack{
                        if showingPros == false && showingEssay == false && showingCons == false && showingInfo == false{
                            ZStack{
                                Color(red: 0, green: 0.8, blue: 0.6)
                                Text(pros[0])
                                    .font(.system(size: 20, design: .rounded))
                                    .bold()
                                    .foregroundColor(.black)
                                    .padding()
                                
                            }
                            .cornerRadius(20)
                            .padding()
                            .onTapGesture {
                                showingPros = true
                            }
                            ZStack{
                                Color(red: 0, green: 0.8, blue: 0.6)
                                Text(cons[0])
                                    .font(.system(size: 20, design: .rounded))
                                    .bold()
                                    .foregroundColor(.black)
                                    .padding()
                                
                            }
                            .cornerRadius(20)
                            .padding()
                            .onTapGesture {
                                showingCons = true
                            }
                            Image("Aussie")
                            ZStack{
                                Color(red: 0, green: 0.8, blue: 0.6)
                                Text(otherInfo[0])
                                    .font(.system(size: 20, design: .rounded))
                                    .bold()
                                    .foregroundColor(.black)
                                    .padding()
                                
                            }
                            .cornerRadius(20)
                            .padding()
                            .onTapGesture {
                                showingInfo = true
                            }
                            ZStack{
                                Color(red: 0, green: 0.8, blue: 0.6)
                                Text(persuasiveEssay[0])
                                    .font(.system(size: 20, design: .rounded))
                                    .bold()
                                    .foregroundColor(.black)
                                    .padding()
                                
                                
                            }
                            .cornerRadius(20)
                            .padding()
                            .onTapGesture {
                                showingEssay = true
                            }
                            
                            Button() {
                                showingDog = true
                            } label: {
                                ZStack {
                                    Color(red: 0, green: 0.8, blue: 0.6)
                                    Text("Home")
                                        .font(.system(size: 40, design: .rounded))
                                        .bold()
                                        .foregroundColor(.black)
                                        .font(.title)
                                }
                                .cornerRadius(20)
                                .padding()
                                
                            }
                            
                        }
                        if showingPros == true{
                            ZStack{
                                Color(red: 0, green: 0.8, blue: 0.6)
                                Text(pros[dog])
                                
                                    .foregroundColor(.black)
                                    .padding()
                                
                            }
                            .cornerRadius(20)
                            .padding()
                            .onTapGesture{
                                showingPros = false
                            }
                            
                        }else if showingCons == true{
                            ZStack{
                                Color(red: 0, green: 0.8, blue: 0.6)
                                Text(cons[dog])
                                    .foregroundColor(.black)
                                    .padding()
                                
                            }
                            .cornerRadius(20)
                            .padding()
                            .onTapGesture{
                                showingCons = false
                            }
                            
                        }else if showingInfo == true{
                            ZStack{
                                Color(red: 0, green: 0.8, blue: 0.6)
                                Text(otherInfo[dog])
                                    .foregroundColor(.black)
                                    .padding()
                                
                            }
                            .cornerRadius(20)
                            .padding()
                            .onTapGesture{
                                showingInfo = false
                            }
                            
                        }
                        else if showingEssay == true{
                            ZStack{
                                Color(red: 0, green: 0.8, blue: 0.6)
                                Text(persuasiveEssay[dog])
                                    .font(.system(size: 13, design: .rounded))
                                    .foregroundColor(.black)
                                    .padding()
                                
                            }
                            .cornerRadius(20)
                            .padding()
                            .onTapGesture{
                                showingEssay = false
                            }
                            
                        }
                        
                    }
                    
                }
                
            }
        }
        if showingDog == true{
            HomeView()
        }
        
        
    }
}

struct DogInfo_Previews: PreviewProvider {
    static var previews: some View {
        DogInfoView(dogs: "AustralianShepherd")
    }
}
