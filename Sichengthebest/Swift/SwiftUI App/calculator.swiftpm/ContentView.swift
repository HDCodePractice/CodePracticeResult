import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack{
                ZStack{
                    Circle()
                        .frame(width: 50,height:50)
                        .foregroundColor(.blue)
                    Text("(")
                }
                ZStack{
                    Circle()
                        .frame(width: 50,height:50)
                        .foregroundColor(.blue)
                    Text(")")
                }
                ZStack{
                    Circle()
                        .frame(width: 50,height:50)
                        .foregroundColor(.blue)
                    Text("%")
                }
                ZStack{
                    Circle()
                        .frame(width: 50,height:50)
                        .foregroundColor(.orange)
                    Text("÷")
                }
                ZStack{
                    Circle()
                        .frame(width: 50,height:50)
                        .foregroundColor(.blue)
                    Text("AC")
                }
                ZStack{
                    Circle()
                        .frame(width: 50,height:50)
                        .foregroundColor(.blue)
                    Text("+/-")
                }
                ZStack{
                    Circle()
                        .frame(width: 50,height:50)
                        .foregroundColor(.blue)
                    Text("%")
                }
                ZStack{
                    Circle()
                        .frame(width: 50,height:50)
                        .foregroundColor(.orange)
                    Text("÷")
                }
            }
            HStack{
                ZStack{
                    Circle()
                        .frame(width: 50,height:50)
                        .foregroundColor(.secondary)
                    Text("7")
                }
                ZStack{
                    Circle()
                        .frame(width: 50,height:50)
                        .foregroundColor(.secondary)
                    Text("8")
                }
                ZStack{
                    Circle()
                        .frame(width: 50,height:50)
                        .foregroundColor(.secondary)
                    Text("9")
                }
                ZStack{
                    Circle()
                        .frame(width: 50,height:50)
                        .foregroundColor(.orange)
                    Text("x")
                }
            }
            HStack{
                ZStack{
                    Circle()
                        .frame(width: 50,height:50)
                        .foregroundColor(.secondary)
                    Text("4")
                }
                ZStack{
                    Circle()
                        .frame(width: 50,height:50)
                        .foregroundColor(.secondary)
                    Text("5")
                }
                ZStack{
                    Circle()
                        .frame(width: 50,height:50)
                        .foregroundColor(.secondary)
                    Text("6")
                }
                ZStack{
                    Circle()
                        .frame(width: 50,height:50)
                        .foregroundColor(.orange)
                    Text("-")
                }
            }
            HStack{
                ZStack{
                    Circle()
                        .frame(width: 50,height:50)
                        .foregroundColor(.secondary)
                    Text("1")
                }
                ZStack{
                    Circle()
                        .frame(width: 50,height:50)
                        .foregroundColor(.secondary)
                    Text("2")
                }
                ZStack{
                    Circle()
                        .frame(width: 50,height:50)
                        .foregroundColor(.secondary)
                    Text("3")
                }
                ZStack{
                    Circle()
                        .frame(width: 50,height:50)
                        .foregroundColor(.orange)
                    Text("+")
                }
            }
            HStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 50)
                        .frame(width: 100,height:50)
                        .foregroundColor(.secondary)
                    Text("0")
                }
                ZStack{
                    Circle()
                        .frame(width: 50,height:50)
                        .foregroundColor(.secondary)
                    Text(".")
                }
                ZStack{
                    Circle()
                        .frame(width: 50,height:50)
                        .foregroundColor(.orange)
                    Text("=")
                }
            }
        }
    }
}
