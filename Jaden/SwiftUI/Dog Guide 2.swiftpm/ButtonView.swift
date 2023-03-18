import SwiftUI

struct ButtonView: View {
    @State var a = 0
    @State var width = 400
    @State var height = 200
    var index : Int
    let pros = ["Pros","Australian Shepherds, also known as Aussies, are a highly versatile and intelligent breed of dog. One of the most significant advantages of owning an Australian Shepherd is their ability to perform a wide range of tasks, from herding livestock to serving as therapy dogs. They are highly trainable and eager to please, making them an excellent choice for owners who are willing to put in the time and effort to teach them new skills. Additionally, Australian Shepherds are known for their high energy levels, which makes them great companions for active families who enjoy spending time outdoors. They also have a strong protective instinct, which can make them excellent watchdogs. Furthermore, Australian Shepherds are generally healthy and long-lived, with a lifespan of 12-15 years, which means they can provide many years of love and companionship to their owners. Overall, Australian Shepherds are a loyal and intelligent breed that can make great pets for the right owners.","Golden retrievers are a popular breed of dog for many reasons, and there are several benefits to owning one. For starters, they are known for their friendly and affectionate nature, which makes them excellent family pets. They are gentle and patient with children, and they tend to get along well with other dogs and even cats. Golden retrievers are also highly intelligent, making them easy to train and a great choice for first-time dog owners. They are known for their loyalty and devotion to their owners, and they thrive on being a part of a family unit. Additionally, golden retrievers are active dogs that enjoy regular exercise, which can help keep their owners active and healthy as well. Overall, owning a golden retriever can bring a lot of joy and companionship to a household.","German Shepherds are a popular and well-loved breed of dog with many pros to consider. One of the most notable pros is their intelligence and trainability, which makes them a great choice for those seeking a working dog. They are quick learners, obedient, and excel at activities such as agility and tracking. German Shepherds are also fiercely loyal and protective of their owners, making them great guard dogs. They are highly athletic and require plenty of exercise and mental stimulation to stay healthy and happy, which can be a benefit for those with an active lifestyle. Additionally, German Shepherds are a versatile breed that can be trained to do many different tasks, making them suitable for roles such as police or military dogs, therapy dogs, or family pets. With proper care and attention, German Shepherds are generally healthy dogs that can live long, happy lives, forming strong bonds with their owners along the way.","Labradoodles are a popular hybrid dog breed that combines the best traits of two purebred breeds: Labrador Retrievers and Poodles. One of the biggest advantages of owning a Labradoodle is their hypoallergenic coat, which is great for individuals with allergies. Labradoodles are also highly intelligent, making them easy to train and ideal for various activities such as agility, obedience, and therapy work. They are also known for their friendly and affectionate nature, making them excellent family pets. Additionally, Labradoodles are known to be relatively low maintenance when it comes to grooming, with their coats requiring only minimal brushing and grooming to keep them looking great. Overall, the Labradoodle's unique combination of traits make them a great choice for many individuals and families looking for a friendly, intelligent, and hypoallergenic dog."]
    var body: some View {
        Button() {
            a += 1
            print(a)
        } label: {
            ZStack {
                Color(red: 0, green: 0.8, blue: 0.6)
                Text(pros[a])
                    .font(.system(size: 40, design: .rounded))
                    .bold()
                    .foregroundColor(.white)
                    .font(.title)
            }
            .frame(width: 400, height: 200)
            .cornerRadius(20)
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(index: 0)
    }
}
