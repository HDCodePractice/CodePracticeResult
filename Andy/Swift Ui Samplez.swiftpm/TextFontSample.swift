import SwiftUI
struct TextFontSample: View{
    var body: some View{
        VStack {
            VStack {
                Text("UltraLight").fontWeight(Font.Weight.ultraLight)
                Text("Thin").fontWeight(Font.Weight.thin)
                Text("Light").fontWeight(Font.Weight.light)
                Text("Regular").fontWeight(Font.Weight.regular)
                Text("Medium").fontWeight(Font.Weight.medium)
                Text("Semibold").fontWeight(Font.Weight.semibold)
                Text("Bold").fontWeight(Font.Weight.bold)
                Text("Heavy").fontWeight(Font.Weight.heavy)
                Text("Black").fontWeight(Font.Weight.black)
            }.font(.title)
        }
    }
}

struct TextFontSample_Previews: PreviewProvider {
    static var previews: some View {
        TextFontSample()
    }
}
