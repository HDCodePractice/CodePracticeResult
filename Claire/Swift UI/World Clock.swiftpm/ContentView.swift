import SwiftUI

struct ContentView: View {
    @State var vm = ViewModel()
    
    
    var body: some View {
        VStack {
            HStack{
                Text("  World Clock")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            Divider()
            Spacer()
        }
    }
}
