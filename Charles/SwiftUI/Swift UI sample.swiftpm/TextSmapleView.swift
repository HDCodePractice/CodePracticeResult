import SwiftUI
struct TextSampleView: View {
    var body: some View {
        VStack{
            Text("Hello World!")
                .fontWeight(.heavy)
                .font(.largeTitle)
                .foregroundColor(.red)
            Text("Hello World 2!")
                .fontWeight(.black)
            Text("Hello World 2!")
                .bold()
                .font(.largeTitle)
        }
    }
        
}

struct TextSampleView_Previews: PreviewProvider {
    static var previews: some View {
        TextSampleView()
    }
}


struct TextFontWeightSample
: View {
    var body: some View {
        
        VStack {
            Text("ultraLight").fontWeight(Font.Weight.ultraLight)
            Text("thin").fontWeight(Font.Weight.thin)
            Text("light").fontWeight(Font.Weight.light)
            Text("regular").fontWeight(Font.Weight.regular)
            Text("medium").fontWeight(Font.Weight.medium)
            Text("semibold").fontWeight(Font.Weight.semibold)
            Text("bold").fontWeight(Font.Weight.bold)
            Text("heavy").fontWeight(Font.Weight.heavy)
            Text("black").fontWeight(Font.Weight.black)
                .font(.title)
        }
    }
}

struct TextDateStyleSample: View {
    let now = Date()
    var body: some View {
        VStack{
            Text("\(now)")
            Text(now, style: .date)
            
        }
    }
}




