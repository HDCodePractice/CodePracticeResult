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
            .cornerRadius(5)
            .shadow(radius: 5)
        Text("Choose one")
            .font(.largeTitle)
            .foregroundColor(.black)
    }
}


