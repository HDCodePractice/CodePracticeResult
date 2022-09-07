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
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(text: "lalala",color: .blue)
    }
}
