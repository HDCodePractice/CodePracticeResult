import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack{
                Image(systemName: "globe").resizable().scaledToFit()//.ImageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.pink)
            }
            
            HStack{
                Image("image1").resizable().scaledToFit()
                Image("image2").resizable().scaledToFit()
    //            Image("image3").resizable().scaledToFit()
            }
        }

    }
}
