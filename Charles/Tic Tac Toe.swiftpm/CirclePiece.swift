import SwiftUI

struct CirclePiece: View {
    var body: some View {
        Circle()
            .padding()
        ForEach (0..<101){index2 in 
            withAnimation{
                frame(width: index2, height: index2)
            }
        }
    }
}

struct CirclePiece_Previews: PreviewProvider {
    static var previews: some View {
        CirclePiece()
    }
}
