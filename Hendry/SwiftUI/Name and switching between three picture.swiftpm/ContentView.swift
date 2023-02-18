import SwiftUI

struct ContentView: View {
    @State var Name = ""
    @State var Class = ""
    @State var Whichpicture = ""
    @State var picturenumber = 1
    var body: some View {
        VStack {
            Form{
                Section{
           
                    Text("Your name")
                    TextField("Name:",
                              text: $Name)
                    Text("Your class")
                    TextField("Class:",
                              text: $Class)
                    Text("Which of the three game below do you like?")
                    TextField("Picture():",
                              text: $Whichpicture)
                }header:{
                    Text("Please fill the information")
                        .font(.title)
                        .fontWeight(.heavy)
                }
                Section{
                    HStack{
                    Spacer()
                    Button("Change to the next picture"){
                        picturenumber+=1
                        if picturenumber == 4{
                            picturenumber = 1
                        }
                    }.buttonStyle(.bordered)
                    Spacer()
                    }
                if picturenumber == 1{
                    Image("genshin")
                        .padding(75.0)
                }
                if picturenumber == 2{
                    Image("fgo")
                        .padding(75.0)
                }
                if picturenumber == 3{
                    Image("honkai")
                        .padding(75.0)
                }
                }
                }
            }
        }
    }
