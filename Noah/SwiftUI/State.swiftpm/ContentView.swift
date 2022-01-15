import SwiftUI

// Form
// Section
// Butoon
// Spacer
// @State
// TextField
// 如何对State var 做set， $变量名
struct ContentView: View {
    @State var imageCount = 1
    
    @State var tapCount = 100
    @State var name = ""
    
    
    var body: some View {

        
        
        Form {
            Text("hi \(name) uwu")
            TextField("whats ur name hottie uwu", text: $name)
            Section{
                Button("Switch girlfriend uwu uwu uwu"){
                    if imageCount < 3 {
                        imageCount += 1
                    } else {
                        imageCount = 1
                    }
                }.buttonStyle(.borderedProminent)
            } header: {
                Text("Girlfriend Generator")
                    .font(.headline)
            }
            Section{
                if imageCount == 1 {
                    Image("noahsgf")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200.0, height: 200.0)
                    Text("Noah's girlfriend very hot uwu")
                } else if imageCount == 2 {
                    Image("sichengsgf")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200.0, height: 200.0)
                    Text("Sicheng's girlfriend very hot uwu")
                } else if imageCount == 3 {
                    Image("parkersgf")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200.0, height: 200.0)
                    Text("Parker's girlfriend very hot uwu")
                }
            }

            
            
        }
    }
}
