import SwiftUI

struct PieceView: View {
    var color : Color = .clear
    var connected : Bool = false
    var body: some View {
        Image(systemName: connected ? "bolt.circle.fill" : "circlebadge.fill")
            .resizable()
            .scaledToFit()
            .foregroundColor(color)
        
        
    }
}

struct PieceView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            PieceView(color: .red)
            PieceView(color: .red, connected: true)
            PieceView(color: .yellow)
            PieceView(color: .yellow, connected: true)
        }
        
    }
}
