import SwiftUI

struct GameResults: View {
    @Binding var player : Int
    @Binding var computer : Int
    @Binding var gameStats : Int
    let choices = ["pencil.circle", "scissors", "hand.wave"]
    let colors : [Color] = [.red, .yellow, .green]
    var body: some View {
        VStack{
            HStack{
                VStack{
                    Text ("Player")
                        .font(.largeTitle)
                    let _ = print(player)
                    Image(systemName: choices[player])
                        .resizable()
                        .scaledToFit()
                        .foregroundColor (colors[player])
                        
                }
                VStack {
                    Text("Computer")
                        .font(.largeTitle)
                    Image(systemName: choices[computer])
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(colors[computer])
                }
                
            }
            if player == computer{
                Text ("It's a tie!")
                    .font(.largeTitle)
            }
            if player == 0 && computer == 2 {
                Text ("You lost!")
                    .font(.largeTitle)
            }else if player == 2 && computer == 0 {
                Text ("You won!")
                    .font(.largeTitle)
            }else if player > computer{
                Text ("You lost, try again")
                    .font(.largeTitle)
            }else if player < computer{
                        Text ("You won!")
                    .font(.largeTitle)
            }
            Text("Play Again")
                .font(.title)
                .padding()
                .background(.cyan)
                .cornerRadius(20)
                .onTapGesture {
                    gameStats=0
                }
        }
        .padding()
    }
}

struct GameResults_Previews: PreviewProvider {
    @State static var player = 0
    @State static var gameStats = 0
    @State static var computer = 0
    static var previews: some View {
        GameResults(player: $player, computer: $computer, gameStats: $gameStats)
    }
}
