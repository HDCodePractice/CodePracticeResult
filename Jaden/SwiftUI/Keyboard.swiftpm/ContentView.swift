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
                                            Text("\(row)")
                                                .font(.title)
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
.previewInterfaceOrientation(.portraitUpsideDown)
    }
}
