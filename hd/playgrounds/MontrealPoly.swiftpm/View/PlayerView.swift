import SwiftUI

struct PlayerView: View {
    var player : Player
    var x: Int
    var y: Int
    
    var body: some View {
        if player.x == x && player.y == y{
            Circle()
                .fill(player.color)
                .frame(width: 20)
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            PlayerView(player: Player(color: .red, x: 10, y: 10, money: 10000),x: 10,y: 10)
            PlayerView(player: Player(color: .red, x: 10, y: 10, money: 10000),x: 11,y: 10)
            PlayerView(player: Player(color: .blue, x: 10, y: 10, money: 10000),x: 10,y: 10)
        }
    }
}
