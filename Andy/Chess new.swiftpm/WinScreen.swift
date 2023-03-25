import SwiftUI

struct winScreen: View {
    var player1 : Player
    var player2 : Player
    var reason : String
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 30)
                .fill(.gray)
                .opacity(0.9)
                .frame(width: 500, height: 800)
            VStack{
                HStack{
                    VStack{
                        RoundedRectangle(cornerRadius: 15)
                            .fill(player1.color)
                            .frame(width:100, height: 100)
                            .padding(20)
                        Text(player1.name)
                    }
                    Text("\(player1.score) | \(player2.score)")
                    VStack{
                        RoundedRectangle(cornerRadius: 15)
                            .fill(player2.color)
                            .frame(width:100, height: 100)
                            .padding(20)
                        Text(player2.name)
                    }
                }
                .padding(-50)
                Text("\(player1.score > player2.score ? player2.name : player1.name) lost. Reason: \(reason)")
                 .padding(100)
            }
        }
    }
}

struct winScreen_Previews: PreviewProvider {
    static var previews: some View {
        winScreen(player1: Player(color: .black, name:"deez nuts", score: 99999999), player2: Player(color: .white, name:"no u",score: -9999999), reason: "cant cook rice")
    }
}
