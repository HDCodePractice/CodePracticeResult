import SwiftUI
struct Card_LoL: View {
    let number : String
    let suit : String
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 40)
            Text(suit)
                .font(.system(size: 100))
                .foregroundColor(.accentColor)
            ZStack(alignment: .topLeading){
                RoundedRectangle(cornerRadius: 40)
                    .fill(.clear)
                HStack{
                    Text(suit)
                        .font(.system(size: 40))
                        .foregroundColor(.accentColor)
                    Text(number)
                        .foregroundColor(.accentColor)
                        .font(.system(size: 40))
                }
                
            }
            .padding()
            ZStack(alignment: .topLeading){
                RoundedRectangle(cornerRadius: 40)
                    .fill(.clear)
                HStack{
                    Text(suit)
                        .font(.system(size: 40))
                        .foregroundColor(.accentColor)
                    Text(number)
                        .foregroundColor(.accentColor)
                        .font(.system(size: 40))
                }
            }
            .padding()
            .rotationEffect(.degrees(180))
        }
        .padding()
    }
}


struct Card_LoL_Previews: PreviewProvider {
    static var previews: some View {
        Card_LoL(number: "10", suit: "♦️")
    }
}
