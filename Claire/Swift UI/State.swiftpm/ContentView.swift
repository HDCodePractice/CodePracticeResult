import SwiftUI

struct ContentView: View {
    @State var tapCount = 100
    @State var name1 = ""
    @State var school1 = ""
    @State var name2 = ""
    @State var school2 = ""
    @State var person = ["Student 1 Avatar 1", "Student 1 Avatar 2", "Student 1 Avatar 3"]
    @State var personPicture = "Student 1 Avatar 1"
    @State var person2 = ["Student 1 Avatar 1", "Student 1 Avatar 2", "Student 1 Avatar 3"]
    @State var person2Picture = "Student 1 Avatar 1"
    
    var body: some View {
        Form {
            Section {
                VStack {
                    Image(personPicture)
                        .frame(width: 100.0, height: 100.0)
                    HStack {
                        Text("Name: ")
                        TextField("Enter your name", text: $name1)
                    }
                    HStack {
                        Text("School: ")
                        TextField("Enter your school", text: $school1)
                    }
                    Image("Student 1 Barcode")
                    Button("Switch Image") {
                        personPicture = person.randomElement()!
                    }.buttonStyle(.borderedProminent)
                }
            } header: {
                HStack {
                    Image(systemName: "person.circle")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text("Student ID for \(name1)")
                        .font(.headline)
                }
            }
            
            Section {
                VStack {
                    Image(person2Picture)
                        .frame(width: 100.0, height: 100.0)
                    HStack {
                        Text("Name: ")
                        TextField("Enter your name", text: $name2)
                    }
                    HStack {
                        Text("School: ")
                        TextField("Enter your school", text: $school2)
                    }
                    Image("Student 1 Barcode")
                    Button("Switch Image") {
                        person2Picture = person2.randomElement()!
                    }.buttonStyle(.borderedProminent)
                }
            } header: {
                HStack {
                    Image(systemName: "person.circle")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text("Student ID for \(name2)")
                        .font(.headline)
                }
            }
        }
    }
}

//Section {
//                Image(systemName: "globe")
//                    .imageScale(.large)
//                    .foregroundColor(.accentColor)
//                Text("Hello, world!")
//                Text("Hello, world!")
//                Text("Hello, world!")
//            } header: {
//                HStack {
//                    Image(systemName: "globe")
//                        .imageScale(.large)
//                        .foregroundColor(.accentColor)
//                    Text("Something")
//                        .font(.headline)
//                }
//            }
//
//            Section {
//                Text("Count: \(tapCount)")
//                HStack {
//                    Spacer()
//                    Button("plus one") {
//                        tapCount += 1
//                    }.buttonStyle(.borderedProminent)
//                    Spacer()
//                    Button("plus two") {
//                        tapCount += 2
//                    }.buttonStyle(.bordered)
//                    Spacer()
//                }
//            } header: {
//                Text("Someone")
//                    .font(.headline)
//            }
//
//            Section {
//                Text("YOUR MOM \(name)")
//                TextField("Enter name", text: $name)
//            }
//        }
