import SwiftUI

struct ContentView: View {
    
    @State var tapCount = 100
    @State var name = ""
    
    var body: some View {
        Form{
            Section{
                Button("Student 001"){
                    Text("Student 001")
                    Image("circ")
                }
            }header: {
                HStack{
                    Spacer()
                    Image(systemName: "circle")
                        .imageScale(.large)
                        .foregroundColor(.red)
                    Image(systemName: "triangle")
                        .imageScale(.large)
                        .foregroundColor(.red)
                    Image(systemName: "square")
                        .imageScale(.large)
                        .foregroundColor(.red)
                    Text("Student Ids")
                    Spacer()
                        
                }.font(.title)
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
               
            }header: {
                Text("Parker")
                    .font(.headline)
            }
            
            Section{
                Text("name:\(name)")
                TextField("Enter name:", text: $name)
            }

        }
    }
}
