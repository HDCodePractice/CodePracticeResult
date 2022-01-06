import SwiftUI

struct ContentView: View {
    let f = ["lb-kg","ft-m","in-cm","°C-°F","m²-ft²"]
    @State var CF = "lb-kg"
    var body: some View {
        Form{
            Image(CF)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            ForEach(f,id:.self){f in Text(f)}.PickerStyle(segmented)
            
        }
    }
}
