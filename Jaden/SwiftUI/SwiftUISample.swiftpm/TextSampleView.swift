import SwiftUI

struct TextSampleView: View {
    var body: some View {
        VStack{
            Text("Hello World!")
                .fontWeight(.heavy)
                .font(.largeTitle)
                .foregroundColor(.red)
            Text("Hello World!")
                .bold()
                .fontWeight(.heavy)
                .font(.largeTitle)
                .foregroundColor(.red)
            Text("Hello World!")
                .font(.largeTitle)
                .foregroundColor(.red)
            Text("Hello World2!")
                .font(.custom("PilGi", size: 33))
        }
    }
}

struct TextSampleView_Previews: PreviewProvider {
    static var previews: some View {
        TextSampleView()
    }
}
