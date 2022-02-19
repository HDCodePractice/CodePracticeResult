import SwiftUI

struct ContentView: View {
    let calc = [["AC","+/-","%","÷"],["7","8","9","×"],["4","5","6","-"],["1","2","3","+"],["0",".","="]]
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
                                            } else {
                                                Color.red
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
                                        .frame(width: 150, height: 70)
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
