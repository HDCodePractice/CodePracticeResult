import SwiftUI

struct ContentView: View {
    let calc = [["(",")","mc","m+","m-","mr","AC","+/-","%","÷"],["2nd","x2","x3","xy","2x","10x","7","8","9","×"],["1/x","2√x","3√x","y√x","In","log10","4","5","6","-"],["x!","sin","cos","tan","e","EE","1","2","3","+"],["Rad","sinh","cosh","tanh","∏","Rand","0",".","="]]
    var body: some View {
        ZStack {
            Color(.black)
            VStack(spacing:-29) {
                    ForEach(calc, id: \.self) { column in
                        HStack (spacing: 3) {
                            ForEach(column, id: \.self) { row in
                                Button() {

                                } label: {
                                    if row != "0" {
                                        ZStack {
                                            if ["=","+","-","×","÷"].contains(row) {
                                                Color.init(red: 155.0, green: 0.0, blue: 20.0)
                                            } else if ["AC","+/-","%"] .contains(row) {
                                                Color.init(red: 00.0, green: 50.0, blue: 100.0)
                                            } else if ["1","2","3","4","5","6","7","8","9","."].contains(row) {
                                                Color.red
                                            }else{
                                                Color.green
                                            }
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
 
