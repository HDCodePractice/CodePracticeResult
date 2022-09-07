import SwiftUI

struct CrossPiece: View {
    var body: some View {
        Image(systemName: "pencil.slash")
            .resizable()
            .padding()
            .scaledToFit()
            ForEach (0..<101){index in 
                withAnimation{
                    frame(width: index, height: index)
                }
        }
    }
}
struct CrossPiece_Previews: PreviewProvider {
    static var previews: some View {
        CrossPiece()
    }
}
