import SwiftUI

struct ContentView: View {
    
    @State var image = ""
    @State var id = ""
    @State var code = ""
    @State var school = ""
    @State var name = ""
    
    var body: some View {
        Form{
            Section{
                HStack{
                    Spacer()
                    Button("Student 001"){
                        id = " 001"
                        image = "circ"
                        school = " Squid Games"
                        code = " 67"
                    }
                    Spacer()
                }
                HStack{
                    Spacer()
                    Button("Student 002"){
                        id = " 002"
                        image = "tri"
                        school = " Squid Games"
                        code = " 456"
                    }
                    Spacer()
                }
                HStack{
                    Spacer()
                    Button("Student 003"){
                        id = " 003"
                        image = "squa"
                        school = " Squid Games"
                        code = " 218"
                    }
                    Spacer()
                }
                HStack{
                    Spacer()
                    Text("Student\(id)")
                    Spacer()
                }
                HStack{
                    Spacer()
                    Image(image)
                    Spacer()
                }
                HStack{
                    Spacer()
                    Text("Name: \(name)")
                    Spacer()
                }
                HStack{
                    Spacer()
                    TextField("Enter name:", text: $name)
                    Spacer()
                }
                HStack{
                    Spacer()
                    Text("School:\(school)")
                    Spacer()
                }
                HStack{
                    Spacer()
                    Text("Code:\(code)")
                    Spacer()
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


        }
    }
}
