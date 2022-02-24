import SwiftUI

struct ContentView: View {
    let calc = [["Q","W","E","R","T","Y","U","I","O","P","delete"],["A","S","D","F","G","H","J","K","L","return"],["uP","Z","X","C","V","B","N","M",",",".","up"],["123","globe","microphone"," ","123","keyboard"]]
    var body: some View {
        ZStack {
            Color(.black)
            VStack(spacing: -26) {
                    ForEach(calc, id: \.self) { column in
                        HStack (spacing: 10) {
                            ForEach(column, id: \.self) { row in
                                Button() {

                                } label: {
                                    if row != " " && row != "microphone" && row != "keyboard" && row != "return" && row != "globe" && row != "delete" && row != "up" && row != "uP"{
                                        ZStack {
                                            
                                            if ["Q","W","E","R","T","Y","U","I","O","P","A","S","D","F","G","H","J","K","L","Z","X","C","V","B","N","M",",","."," "].contains(row) {
                                                Color.gray
                                            }else{
                                                Color.init(red: 0.2, green: 0.2, blue: 0.2)
                                            }
                                            if row == "Q"{
                                                VStack{
                                                    Text("1")
                                                        .font(.system(size: 20, design: .rounded))
                                                        .foregroundColor(.white)
//                                                        .padding()
                                                    Spacer()
                                                }

                                            } else if row == "W"{
                                                VStack{
                                                    Text("2")
                                                        .font(.system(size: 20, design: .rounded))
                                                        .foregroundColor(.white)
//                                                        .padding()
                                                    Spacer()
                                                }

                                            } else if row == "E"{
                                                VStack{
                                                    Text("3")
                                                        .font(.system(size: 20, design: .rounded))
                                                        .foregroundColor(.white)
//                                                        .padding()
                                                    Spacer()
                                                }

                                            } else if row == "R"{
                                                VStack{
                                                    Text("4")
                                                        .font(.system(size: 20, design: .rounded))
                                                        .foregroundColor(.white)
//                                                        .padding()
                                                    Spacer()
                                                }

                                            } else if row == "T"{
                                                VStack{
                                                    Text("5")
                                                        .font(.system(size: 20, design: .rounded))
                                                        .foregroundColor(.white)
//                                                        .padding()
                                                    Spacer()
                                                }

                                            } else if row == "Y"{
                                                VStack{
                                                    Text("6")
                                                        .font(.system(size: 20, design: .rounded))
                                                        .foregroundColor(.white)
//                                                        .padding()
                                                    Spacer()
                                                }

                                            } else if row == "U"{
                                                VStack{
                                                    Text("7")
                                                        .font(.system(size: 20, design: .rounded))
                                                        .foregroundColor(.white)
//                                                        .padding()
                                                    Spacer()
                                                }

                                            } else if row == "I"{
                                                VStack{
                                                    Text("8")
                                                        .font(.system(size: 20, design: .rounded))
                                                        .foregroundColor(.white)
//                                                        .padding()
                                                    Spacer()
                                                }

                                            } else if row == "O"{
                                                VStack{
                                                    Text("9")
                                                        .font(.system(size: 20, design: .rounded))
                                                        .foregroundColor(.white)
//                                                        .padding()
                                                    Spacer()
                                                }

                                            } else if row == "P"{
                                                VStack{
                                                    Text("0")
                                                        .font(.system(size: 20, design: .rounded))
                                                        .foregroundColor(.white)
//                                                        .padding()
                                                    Spacer()
                                                }

                                            } else if row == "A"{
                                                VStack{
                                                    Text("@")
                                                        .font(.system(size: 20, design: .rounded))
                                                        .foregroundColor(.white)
//                                                        .padding()
                                                    Spacer()
                                                }

                                            } else if row == "S"{
                                                VStack{
                                                    Text("#")
                                                        .font(.system(size: 20, design: .rounded))
                                                        .foregroundColor(.white)
//                                                        .padding()
                                                    Spacer()
                                                }

                                            } else if row == "D"{
                                                VStack{
                                                    Text("¥")
                                                        .font(.system(size: 20, design: .rounded))
                                                        .foregroundColor(.white)
//                                                        .padding()
                                                    Spacer()
                                                }

                                            } else if row == "F"{
                                                VStack{
                                                    Text("&")
                                                        .font(.system(size: 20, design: .rounded))
                                                        .foregroundColor(.white)
//                                                        .padding()
                                                    Spacer()
                                                }

                                            } else if row == "G"{
                                                VStack{
                                                    Text("*")
                                                        .font(.system(size: 20, design: .rounded))
                                                        .foregroundColor(.white)
//                                                        .padding()
                                                    Spacer()
                                                }

                                            } else if row == "H"{
                                                VStack{
                                                    Text("(")
                                                        .font(.system(size: 20, design: .rounded))
                                                        .foregroundColor(.white)
//                                                        .padding()
                                                    Spacer()
                                                }

                                            } else if row == "J"{
                                                VStack{
                                                    Text(")")
                                                        .font(.system(size: 20, design: .rounded))
                                                        .foregroundColor(.white)
//                                                        .padding()
                                                    Spacer()
                                                }

                                            } else if row == "K"{
                                                VStack{
                                                    Text("'")
                                                        .font(.system(size: 20, design: .rounded))
                                                        .foregroundColor(.white)
//                                                        .padding()
                                                    Spacer()
                                                }

                                            } else if row == "L"{
                                                VStack{
                                                    Text(""")
                                                        .font(.system(size: 20, design: .rounded))
                                                        .foregroundColor(.white)
//                                                        .padding()
                                                    Spacer()
                                                }

                                            } else if row == "Z"{
                                                VStack{
                                                    Text("%")
                                                        .font(.system(size: 20, design: .rounded))
                                                        .foregroundColor(.white)
//                                                        .padding()
                                                    Spacer()
                                                }

                                            } else if row == "X"{
                                                VStack{
                                                    Text("-")
                                                        .font(.system(size: 20, design: .rounded))
                                                        .foregroundColor(.white)
//                                                        .padding()
                                                    Spacer()
                                                }

                                            } else if row == "C"{
                                                VStack{
                                                    Text("+")
                                                        .font(.system(size: 20, design: .rounded))
                                                        .foregroundColor(.white)
//                                                        .padding()
                                                    Spacer()
                                                }

                                            } else if row == "V"{
                                                VStack{
                                                    Text("=")
                                                        .font(.system(size: 20, design: .rounded))
                                                        .foregroundColor(.white)
//                                                        .padding()
                                                    Spacer()
                                                }

                                            } else if row == "B"{
                                                VStack{
                                                    Text("/")
                                                        .font(.system(size: 20, design: .rounded))
                                                        .foregroundColor(.white)
//                                                        .padding()
                                                    Spacer()
                                                }

                                            } else if row == "N"{
                                                VStack{
                                                    Text(";")
                                                        .font(.system(size: 20, design: .rounded))
                                                        .foregroundColor(.white)
//                                                        .padding()
                                                    Spacer()
                                                }

                                            } else if row == "M"{
                                                VStack{
                                                    Text(":")
                                                        .font(.system(size: 20, design: .rounded))
                                                        .foregroundColor(.white)
//                                                        .padding()
                                                    Spacer()
                                                }

                                            } else if row == ","{
                                                VStack{
                                                    Text("!")
                                                        .font(.system(size: 20, design: .rounded))
                                                        .foregroundColor(.white)
//                                                        .padding()
                                                    Spacer()
                                                }

                                            } else if row == "."{
                                                VStack{
                                                    Text("?")
                                                        .font(.system(size: 20, design: .rounded))
                                                        .foregroundColor(.white)
//                                                        .padding()
                                                    Spacer()
                                                }

                                            }
                                            Text("\(row)")
                                                .font(.title)
                                                .foregroundColor(.white)
                                        }
                                        .frame(width: 70, height: 70)
                                        .clipShape(RoundedRectangle(cornerRadius: 5))
                                        .shadow(radius: 5)
                                    } else if row == " " {
                                        ZStack {
                                            Color.gray
//                                            Image(systemName: "mic")
                                        }
                                        .frame(width: 440, height: 70)
                                        .clipShape(RoundedRectangle(cornerRadius:5))
                                        .shadow(radius: 5)
                                    } else if row == "microphone"{
                                        ZStack {
                                            Color.init(red: 0.2, green: 0.2, blue: 0.2)
                                            Image(systemName: "mic")
                                        }
                                        .frame(width: 70, height: 70)
                                        .clipShape(RoundedRectangle(cornerRadius:5))
                                        .shadow(radius: 5)

                                    } else if row == "keyboard"{
                                        ZStack {
                                            Color.init(red: 0.2, green: 0.2, blue: 0.2)
                                            Image(systemName: "keyboard.chevron.compact.down")
                                        }
                                        .frame(width: 70, height: 70)
                                        .clipShape(RoundedRectangle(cornerRadius:5))
                                        .shadow(radius: 5)
                                    } else if row == "globe"{
                                        ZStack {
                                            Color.init(red: 0.2, green: 0.2, blue: 0.2)
                                            Image(systemName: "globe")
                                        }
                                        .frame(width: 70, height: 70)
                                        .clipShape(RoundedRectangle(cornerRadius:5))
                                        .shadow(radius: 5)
                                    } else if row == "up"{
                                        ZStack {
                                            Color.init(red: 0.8, green: 0.8, blue: 0.8)
                                            Image(systemName: "arrow.up")
                                        }
                                        .frame(width: 70, height: 70)
                                        .clipShape(RoundedRectangle(cornerRadius:5))
                                        .shadow(radius: 5)
                                    } else if row == "uP"{
                                        ZStack {
                                            Color.init(red: 0.8, green: 0.8, blue: 0.8)
                                            Image(systemName: "arrow.up")
                                        }
                                        .frame(width: 70, height: 70)
                                        .clipShape(RoundedRectangle(cornerRadius:5))
                                        .shadow(radius: 5)
                                    } else if row == "return"{
                                        ZStack {
                                            Color.init(red: 0.2, green: 0.2, blue: 0.2)
                                            Text("return")
                                        }
                                        .frame(width: 100, height: 70)
                                        .clipShape(RoundedRectangle(cornerRadius:5))
                                        .shadow(radius: 5)
                                    } else if row == "delete"{
                                        ZStack {
                                            Color.init(red: 0.2, green: 0.2, blue: 0.2)
                                            Image(systemName: "delete.left")
                                        }
                                        .frame(width: 70, height: 70)
                                        .clipShape(RoundedRectangle(cornerRadius:5))
                                        .shadow(radius: 5)
                                    }
                                    
                                }
                            }
                        }.padding()
                    }
                }
        }
        .ignoresSafeArea()
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
