import SwiftUI

struct GameResults: View {
    // 0P/1S/2R
    @Binding var player: Int
    @Binding var computer: Int
    // 0Start/1Results
    @Binding var gameStep: Int
    let choices = ["pencil.circle","scissors","hand.wave"]
    var body: some View {
        VStack{
            HStack{
                VStack{
                    Text("Player")
                        .font(.title)
                    Image(systemName: choices[player])
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.cyan)
                }
                VStack{
                    Text("Computer")
                        .font(.title)
                    Image(systemName: choices[computer])
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.red)
                }
            }
            if player == computer{
                Text("It's a tie!")
                    .font(.largeTitle)
                    .foregroundColor(.orange)
            }
            if player == 0 && computer == 2 {
                Text("You lost!")
                    .font(.largeTitle)
                    .foregroundColor(.orange)
            }else if player == 2 && computer == 0 {
                Text("You won!")
                    .font(.largeTitle)
                    .foregroundColor(.orange)
            }else if player > computer{
                Text("You lost!")
                    .font(.largeTitle)
                    .foregroundColor(.orange)
            }else if player < computer {
                Text("You Won!")
                    .font(.largeTitle)
                    .foregroundColor(.orange)
            }

            Text("Play Again")
                .font(.title)
                .padding()
                .background(.cyan)
                .cornerRadius(20)
                .onTapGesture {
                    gameStep=0
                }
            
        }
        .padding()
    }
}

struct GameResults_Previews: PreviewProvider {
    @State static var player = 0
    @State static var gameStep = 0
    @State static var computer = 0
    static var previews: some View {
        GameResults(player: $player, computer: $computer, gameStep: $gameStep)
    }
}
