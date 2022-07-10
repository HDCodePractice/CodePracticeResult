import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    var body: some View {
        HStack {
            ForEach(0..<vm.pieces.count,id:\.self){ column in
                VStack{
                    ForEach(0..<vm.pieces[column].count,id:\.self){ row in
                        ZStack{
                            PiceView(
                                color: vm.pieceColors[column][row],
                                connected: vm.pieces[column][row])
                                .onTapGesture {
                                    vm.tapPice(colum: column, row: row)
                                }
                            Text("\(column),\(row)")
                                .foregroundColor(.black)
                        }
                    }
                }
            }
        }
        .padding()
        .background(.blue)
        .cornerRadius(10)
        .padding()
    }
}
