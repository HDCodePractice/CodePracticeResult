import SwiftUI

// Form
// Section
// Butoon
// Spacer
// @State
// TextField
// 如果对State var 做set， $

struct ContentView: View {
    @State var tapCount = 100
    @State var name = ""
    
    var body: some View {
        Form {
            Section{
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
                Text("Hello, world!")
                Text("Hello, world!")
                Text("Hello, world!")
            } header: {
                HStack{
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text("Noah")
                        .font(.headline)
                }
            }
            
            Section{
                Text("Count: \(tapCount)")
                HStack{
                    Spacer()
                    Button("plus one"){
                        tapCount += 1
                    }.buttonStyle(.borderedProminent)
                    Spacer()
                    Button("plus two"){
                        tapCount += 2
                        tapCount += 5
                    }.buttonStyle(.bordered)
                    Spacer()
                }
            } header: {
                Text("Parker")
                    .font(.title)
            }
            
            Section{
                Text("name: \(name)")
                TextField("Enter name", text: $name)
                
            }
        }
    }
}
