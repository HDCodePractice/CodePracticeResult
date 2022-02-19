import SwiftUI

struct ContentView: View {
    let inputOrder = [["AC","+/-","%","÷"],["7","8","9","×"],["4","5","6","-"],["1","2","3","+"],["0",".","="]]
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
                                                Color.init(red: 0.0, green: 50.0, blue: 50.0)
                                            } else {
                                                Color.blue
                                            }
                                            Text("\(row)")
                                                .font(.title)
                                                .foregroundColor(.white)
                                        }
                                        .frame(width: 70, height: 70)
                                        .clipShape(RoundedRectangle(cornerRadius: 40))
                                        .shadow(radius: 5)
                                    } else if row == "0" {
                                        ZStack {
                                            Color.blue
                                            Text("\(row)")
                                                .font(.title)
                                                .foregroundColor(.white)
                                        }
                                        .frame(width: 140, height: 70)
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
