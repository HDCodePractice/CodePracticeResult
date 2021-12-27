import SwiftUI

struct ContentView: View {
    @State var imageindex = 0
    var images = ["profilepic-xmas","profilepic","botogod pfp"]
    var body: some View {
        VStack {
            Image("\(images[imageindex])")
                .resizable()
                .scaledToFit()
            Button("Change image") {
                imageindex += 1
                if imageindex > 2 {
                    imageindex = 0
                }
            }.buttonStyle(.bordered)
            Text("Name: Sichengthebest")
                .font(.title)
            Text("School: TMS")
                .font(.title)
            Image("barcode")
                .resizable()
                .scaledToFit()
        }
    }
}
