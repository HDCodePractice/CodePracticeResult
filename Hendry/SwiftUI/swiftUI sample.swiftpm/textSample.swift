import SwiftUI

struct TextSampleView: View {
    var body: some View {
        VStack{
            Text("Hello World!")
                .fontWeight(.heavy)
                .font(.largeTitle)
                .foregroundColor(.red)
            Text("Hello World2!")
                .font(.custom("Nanum Pen Script", size: 32))
        }
    }
}

struct TextSampleView_Previews: PreviewProvider {
    static var previews: some View {
        TextSampleView()
    }
}
