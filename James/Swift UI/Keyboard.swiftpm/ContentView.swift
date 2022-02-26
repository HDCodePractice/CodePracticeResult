import SwiftUI

struct ContentView: View {
    let key = [["q","w","e","r","t","y","u","i","o","p","delete"],["CAP","a","s","d","f","g","h","j","k","l","return"],["z", "x","c","v","b","n","m",",","."]]
    var body: some View {
        ZStack {
            Color(.black)
            VStack(spacing:-29) {
                    ForEach(key, id: \.self) { column in
                        HStack (spacing: 3) {
                            ForEach(column, id: \.self) { row in
                                Button() {

                                } label: {
                                    if row != "0" {
                                        ZStack {
                                            Text("\(row)")
                                                .font(.title)
                                        }
                                        .frame(width: 70, height: 70)
                                        .clipShape(RoundedRectangle(cornerRadius: 40))
                                        .shadow(radius: 5)
                                    } else if row == "0" {
                                        ZStack {
                                            Color.red
                                            Text("\(row)")
                                                .font(.title)
                                        }
                                        .frame(width: 146, height: 70)
                                        .clipShape(RoundedRectangle(cornerRadius: 40))
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
 
