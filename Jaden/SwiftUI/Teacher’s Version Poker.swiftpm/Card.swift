import SwiftUI

struct Card: View {
    let testNumber : String
    let testSuit : String
    var body: some View {
        VStack{
            ZStack(alignment: .topLeading){
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
                    .border(.black)
                VStack{
                    Text(testNumber)
                        .frame(width: 100, height: 100)
                        .font(.system(size: 100))
                    Text(testSuit)
                        .frame(width: 100, height: 100)
                        .font(.system(size: 100))
                }
                .padding()
                ZStack(alignment: .center){
                    Color.clear
                    Text(testSuit)
                        .font(.system(size: 200))
                }
                ZStack(alignment: .bottomTrailing){
                    Color.clear
                    VStack{
                        Text(testSuit)
                            .frame(width: 100, height: 100)
                            .font(.system(size: 100))
                            .rotationEffect(.degrees(180))
                        Text(testNumber)
                            .frame(width: 100, height: 100)
                            .font(.system(size: 100))
                            .rotationEffect(.degrees(180))
                    }
                    .padding()
                }
                
            }
        }
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(testNumber: "10", testSuit: "♣️")
    }
}

