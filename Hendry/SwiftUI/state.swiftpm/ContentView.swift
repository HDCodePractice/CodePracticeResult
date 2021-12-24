//Form
//section
//header
//spacer
//button
//buttonstyle
//@state
//textfield
import SwiftUI

struct ContentView: View {
    @State var tapcount = 100
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
                Text("hendry")
                }
            Section{
                Text("Count:\(tapcount)")
                HStack{
                Spacer()
                Button("plus one"){
                    tapcount+=1
                }.buttonStyle(.bordered)
                Button("plus two"){
                    tapcount+=2
                    }.buttonStyle(.borderedProminent)
                    Spacer()
                    }
                }header: {
                    Text("shn").font(.title)
                }
                    Section{
                        Text("Name:\(name)")
                        TextField("Enter Name:", text: $name)
            }
        }
    }
}
