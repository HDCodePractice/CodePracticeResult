import SwiftUI

struct ContentView: View {
    @State var length = 0
    @State var inputWeight = ""
    @State var inputLength = 0
    @State var inputTemp = 0
    @State var inputArea = 0
    
    var body: some View {
        Form {
            Section {
                Text("weight")
                HStack {
                    Text("Your input:")
                    TextField("Enter weight...", text: $inputWeight)
                }
                Text("hello\(inputWeight)")
            }header: {
                HStack{
                    Image(systemName: "arrow.left.and.right.righttriangle.left.righttriangle.right")
                        .foregroundColor(.accentColor)
                    Text("lb to kg")
                }
            }
            
            Section {
                Text("length")
            }header: {
                HStack{
                    Image(systemName: "comb")
                        .foregroundColor(Color("AccentColor"))
                    Text("ft to cm")
                }
            }
            
            Section {
                Text("temp")
            }header: {
                HStack{
                    Image(systemName: "thermometer")
                        .foregroundColor(Color("AccentColor"))
                    Text("°C to °F")
                }
            }
            
            Section {
                Text("area")
            }header: {
                HStack {
                    Image(systemName: "rectangle.dashed")
                        .foregroundColor(.accentColor)
                    Text("Area Conversion")
                }
            }
        }
    }
}
