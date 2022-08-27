import Foundation
import SwiftUI

struct PrimaryButton: View {
    var text: String
    var background: Color
    
    init(_ text:String, background: Color = .accentColor) {
        self.text = text
        self.background = background
    }
    
    var body: some View {
        Text(text)
            .frame(maxWidth:.infinity)
            .foregroundColor(.white)
            .padding()
            .padding(.horizontal)
            .background(background)
            .cornerRadius(30)
            .shadow(radius: 10)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton("Easy", background: .accentColor)
    }
}
