import SwiftUI

struct ContentView: View {
    let actors = ["rock","bean","carrey"]
    @State var choiceActor = "rock"
    var body: some View {
        Form{
            Section{
                ForEach(0..<2){
                    Text("Hello, world!\($0)")
                }
                ForEach(2..<4){i in
                    Text("Hello, world!\(i)")
                }
            }header: {
                Text("Demo")
            }
            Section{
                Image("rock")
                    .resizable()
                    .scaledToFit()
                Picker("Your choice",selection:$choiceActor){
                    ForEach(actors,id: \.self){ actor in
                        Text(actor)
                    }
                }.pickerStyle(.segmented)
            }header:{
                HStack{
                    Image(systemName: "person.fill.questionmark")
                    Text("Choose Actor")
                }
            }
        }
    }
}

