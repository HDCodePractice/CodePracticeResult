import SwiftUI

struct ContentView: View {
    @State var tapscount = 0
    @State var tapscount1 = 0
    @State var tapscount2 = 0
    @State var tapscount3 = 0
    @State var name = ""
    var body: some View {
        Form {
            Section {
                HStack {
                    Image(systemName: "circle")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text("Click count: \(tapscount)")
                }
                Button("Click this button. Now. Or else you die.") {
                    tapscount += 1
                }.buttonStyle(.bordered)
            } header: {
                Text("ta douce mélodie me réveille chaque matin")
                    .font(.headline)
            }
            Section {
                HStack {
                    Image(systemName: "triangle")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text("Click count 2: \(tapscount1)")
                }
                Button("Click this button. Now. Or else you get tortured.") {
                    tapscount1 += 2
                }.buttonStyle(.bordered)
            } header: {
                Text("avant même d'embrasser ma femme je te prends par la main")
                    .font(.headline)
            }
            Section {
                HStack {
                    Image(systemName: "square")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text("Click count 3: \(tapscount2)")
                }
                Button("Click this button. Now. Or else your family dies.") {
                    tapscount2 += 3
                }.buttonStyle(.bordered)
            } header: {
                Text("et puis je te caresse le visage pour voir si tu vas bien")
                    .font(.headline)
            }
            Section {
                HStack {
                    Image(systemName: "umbrella")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text("Click count 4: \(tapscount3)")
                }
                Button("Click this button. Now. Or else... Nothing.") {
                    tapscount3 += 4
                }.buttonStyle(.bordered)
            } header: {
                Text("tellement inséparables qu'on va ensemble au petit coin")
                    .font(.headline)
            }
            Section {
                Text("Name: \(name)")
                TextField("Enter your name", text: $name)
            }
        }
    }
}
