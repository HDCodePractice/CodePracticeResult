import SwiftUI

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
    var color: Color
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(color)
            Text(text)
                .foregroundColor(.black)
                .padding()
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(text: "lalalalalalalalalalalalalalalalalalalalalalalalalalalalalalalalalalalalalalalalalalalalalalalala",color: .blue)
    }
}

struct RectButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RectButtonView(text: "lalalalalalalalalalalalalalalalalalalalalalalalalalalalalalalalalalalalalalalalalalalalalalalala",color: .blue)
    }
}
