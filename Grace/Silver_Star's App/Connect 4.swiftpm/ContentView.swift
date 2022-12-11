import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    var body: some View {
        HStack {
            ForEach(0..<vm.pieces.count,id:\.self){ column in
                VStack{
                    ForEach(0..<vm.pieces[column].count,id:\.self){ row in
                        ZStack{
                            PieceView(color: vm.pieceColors[column][row],
                                      connected: vm.pieces[column][row])
                                        
                            .onTapGesture {
                                vm.tapPiece(column: column, row: row)
                                
                            }
                            Text("\(column), \(row)")
                                .foregroundColor(.black)
                        }
                        
                    }
                }
            }
            
        }
        .padding()
        .background(.blue)
        .cornerRadius(20)
        .padding(20)
    }
}
