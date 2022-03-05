import SwiftUI

struct ContentView: View {
    let inputOrder = [
        ["(",")","mc","m+","m-","mr","AC","+/-","%","÷"],
        ["2nd","x^2","x^3","x^y","e^x","10^x","7","8","9","×"],
        ["1/x","2√x","3√x","y√x","ln","log10","4","5","6","-"],
        ["x!","sin","cos","tan","e","EE","1","2","3","+"],
        ["Rad","sinh","cosh","tanh","π","Rand","0",".","="]]
    var body: some View {
        ZStack {
            Color(.black)
            VStack(spacing:-29) {
                    ForEach(inputOrder, id: \.self) { column in
                        HStack (spacing: 3) {
                            ForEach(column, id: \.self) { row in
                                Button() {
                                    
                                } label: {
                                    if row != "0" {
                                        ZStack {
                                            if ["=","+","-","×","÷"].contains(row) {
                                                Color.init(red: 0.0, green: 0.0, blue: 250.0)
                                            } else if ["AC","+/-","%"] .contains(row) {
                                                Color.init(red: 0.0, green: 25.0, blue: 50.0)
                                            } else if ["7","8","9","4","5","6","1","2","3","0","."].contains(row) {
                                                Color.blue
                                            } else {
                                                Color.gray
                                            }
                                            Text("\(row)")
                                                .font(.title2)
                                                .foregroundColor(.white)
                                        }
                                        .frame(width: 70, height: 60)
                                        .clipShape(RoundedRectangle(cornerRadius: 30))
                                        .shadow(radius: 5)
                                    } else if row == "0" {
                                        ZStack {
                                            Color.blue
                                            Text("\(row)")
                                                .font(.title2)
                                                .foregroundColor(.white)
                                        }
                                        .frame(width: 143, height: 60)
                                        .clipShape(RoundedRectangle(cornerRadius: 30))
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
