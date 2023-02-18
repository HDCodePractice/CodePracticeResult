import SwiftUI

struct CrossPiece: View {
    var body: some View {
        Image(systemName: "pencil.slash")
            .resizable()
            .scaledToFit()
            .padding()
    }
}

struct CrossPiece_Previews: PreviewProvider {
    static var previews: some View {
        CrossPiece()
    }
}
