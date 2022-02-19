import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack{
                HStack{
                Text("AC")
                    .frame(width: 25.0)
                    .background(.brown)
                    .font(.title)
                }
                Text("+/-")
                    .frame(width: 30.0)
                    .background(.brown)
                    .font(.title)
                
                Text("%")
                    .frame(width: 30.0)
                    .background(.brown)
                    .font(.title)
                Text("/")
                    .frame(width: 30.0)
                    .background(.blue)
                    .font(.title)
            }
            HStack{
                Text("7")
                    .frame(width: 30.0)
                    .background(.gray)
                    .font(.title)
                Text("8")
                    .frame(width: 30.0)
                    .background(.gray)
                    .font(.title)
                Text("9")
                    .frame(width: 30.0)
                    .background(.gray)
                    .font(.title)
                Text("*")
                    .frame(width: 30.0)
                    .background(.blue)
                    .font(.title)
            }
            HStack{
                Text("4")
                    .frame(width: 30.0)
                    .background(.gray)
                    .font(.title)
                Text("5")
                    .frame(width: 30.0)
                    .background(.gray)
                    .font(.title)
                Text("6")
                    .frame(width: 30.0)
                    .background(.gray)
                    .font(.title)
                Text("-")
                    .frame(width: 30.0)
                    .background(.blue)
                    .font(.title)
            }
            HStack{
                Text("1")
                    .frame(width: 30.0)
                    .background(.gray)
                    .font(.title)
                Text("2")
                    .frame(width: 30.0)
                    .background(.gray)
                    .font(.title)
                Text("3")
                    .frame(width: 30.0)
                    .background(.gray)
                    .font(.title)
                Text("+")
                    .frame(width: 30.0)
                    .background(.blue)
                    .font(.title)
            }
            HStack{
                Text("0")
                    .frame(width: 68.0)
                    .background(.gray)
                    .font(.title)
                Text(".")
                    .frame(width: 30.0)
                    .background(.gray)
                    .font(.title)
                Text("=")
                    .frame(width: 30.0)
                    .background(.blue)
                    .font(.title)
            }
        }
    }
}
