import SwiftUI
struct TextSampleView: View {
    var body: some View {
        VStack{
            Text("Italic")
                .font(.largeTitle)
                .fontWeight(.black)
                .italic()
            Text("Custom")
                .font(.custom("Nanum Pen Script", size: 50))
            Text("Standard(Nothing)")
                .font(.largeTitle)
            Text("Stripes")
                .strikethrough(true, color: .orange)
                .font(.largeTitle)
            Text("underline")
                .underline(true, color: .blue)
                .font(.largeTitle)
            
            Text("00000(mono)")
                
                .monospacedDigit()
                .font(.largeTitle)
            Text("11111(mono)")
                .monospacedDigit()
                .font(.largeTitle)
            Text("00000(no mono)")
                
                .font(.largeTitle)
            Text("11111(no mono)")
                
                .font(.largeTitle)
        }
    }
    
}

struct TextSampleView_previews: PreviewProvider {
    static var previews: some View {
        TextSampleView()
    }
}


    
