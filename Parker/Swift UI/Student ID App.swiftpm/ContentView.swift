import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Student ID")
                .font(.system(size: 60))
                .frame(maxWidth: .infinity)
            Image("the-rock")
                .border(Color.black, width: 8)
            Text("Name: Dwayne Johnson")
                .font(.system(size: 45))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("School: University of Miami")
                .font(.system(size: 45))
                .frame(maxWidth: .infinity, alignment: .leading)
            Link("University of Miami", destination: URL(string: "https://welcome.miami.edu/")!)
                .font(.system(size: 30))
                .frame(maxWidth: .infinity, alignment: .leading)
            Image("Barcode")
                    .resizable()
        }
    }
}
