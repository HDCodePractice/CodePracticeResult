import SwiftUI

struct ContentView: View {
    @State private var showText = false
    var body: some View {
        HStack {
            Text("Student ID")
                .font(.system(size: 45))
                .frame(maxWidth: .infinity)
            Image("uoml")
        }
        VStack {
            
            Image("the-rock")
                .border(Color.black, width: 8)
            HStack {
                Text("Name: Dwayne Johnson")
                    .font(.system(size: 27))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Button("Show Student Details") {
                            showText.toggle()
                            }

                            if showText {
                                Text("Birthdate:  1972-05-02")
                            }
                

            }

            Text("--------------------------------")
                .font(.system(size: 30))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("School: University of Miami")
                .font(.system(size: 30))
                .frame(maxWidth: .infinity, alignment: .leading)
            Link("University of Miami", destination: URL(string: "https://welcome.miami.edu/")!)
                .font(.system(size: 20))
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack {
                Text("Student Code:")
                    .font(.system(size: 45))
                    .frame(maxWidth: .infinity)
                Image("Barcode")
                        .resizable()
            }
        }
    }
}
