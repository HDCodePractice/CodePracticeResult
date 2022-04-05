import SwiftUI

struct ContentView: View {
    
    @State var vm = ViewModule()
    
    var body: some View {
        let scale: CGFloat = CGFloat(Float(185 / vm.gridSize))

        ZStack {
            
            ForEach(vm.pieces, id: \.self){ row in
                ForEach(row) { go in
                    ChessboardView(scale: scale, pieces: go)
                }
            }
            
        }
    }
}
