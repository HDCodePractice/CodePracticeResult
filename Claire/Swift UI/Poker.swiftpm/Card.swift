import SwiftUI

struct Card: View {
    let number = "5"
    let suit = "♠️"
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
            Text(suit)
                .font(.system(size: 200))
            ZStack(alignment: .topLeading){
                Color.clear
                VStack{
                    HStack{
                        VStack{
                            Text(number)
                                .foregroundColor(.black)
                            Text(suit)
                        }
                        Spacer()
                    }
                    Spacer()
                    HStack{
                        Spacer()
                        VStack{
                            Text(suit)
                                .rotationEffect(.degrees(180))
                            Text(number)
                                .foregroundColor(.black)
                                .rotationEffect(.degrees(180))
                        }
                    }
                }
                .font(.system(size: 50))
                .padding()
            }
        }
        .padding()
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card()
    }
}
