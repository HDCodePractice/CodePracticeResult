import SwiftUI

struct DrawButtons: View {
    var body: some View {
        ZStack {
            Color.accentColor
            Image(systemName: "desktopcomputer")
                .resizable()
                .foregroundColor(.white)
                .frame(width: 120, height: 120)
        }
            .frame(width: 150, height: 150)
            .cornerRadius(10)
            .shadow(radius: 10         )
        Text("Choose one")
            .font(.largeTitle)
            .foregroundColor(.black)
    }
}


