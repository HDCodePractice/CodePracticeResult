import SwiftUI

struct ButtonItemView: View {
    var button : ButtonItem
    var body: some View {
        ZStack{
            Text(button.title)
                .padding()
                .background(.quaternary)
                .cornerRadius(10)
        }
    }
}

struct ButtonItemView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            ButtonItemView(button: .function(.delete))
        }
    }
}

