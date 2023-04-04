import SwiftUI

// Making the simple button views
struct ButtonView: View {
    var text: String
    var color: Color
    var body: some View {
        ZStack{
            Circle()
                .foregroundColor(color)
            Text(text)
                .foregroundColor(.black)
                .padding()
        }
    }
}

struct RectButtonView: View {
    var text: String
    var image: String
    var color: Color
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(color)
            HStack {
                Image(systemName: image)
                    .foregroundColor(.black)
                Text(text)
                    .foregroundColor(.black)
            }
            .padding()
        }
    }
}

