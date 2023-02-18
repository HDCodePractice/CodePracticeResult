import SwiftUI

struct PiceView: View {
    var color : Color = .clear
    var connected : Bool = false
    var body: some View {
        Image(systemName: connected ? "bolt.circle.fill" : "circlebadge.fill")
            .resizable()
            .scaledToFit()
            .foregroundColor(color)
    }
}

struct PiceView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            PiceView(color: .red)
            PiceView(color: .red, connected: true)
            PiceView(color: .yellow)
            PiceView(color: .yellow, connected: true)
        }
        
    }
}
