import SwiftUI

struct ContentView: View {
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
            Text("Name: Dwayne Johnson")
                .font(.system(size: 30))
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("---------------------")
                .font(.system(size: 30))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("School: University of Miami")
                .font(.system(size: 30))
                .frame(maxWidth: .infinity, alignment: .leading)
            Link("University of Miami", destination: URL(string: "https://welcome.miami.edu/")!)
                .font(.system(size: 20))
                .frame(maxWidth: .infinity, alignment: .leading)
            Image("Barcode")
                    .resizable()
        }
    }
}
