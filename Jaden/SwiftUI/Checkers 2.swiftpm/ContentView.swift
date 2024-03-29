import SwiftUI
struct ContentView: View {
    @State var board = Board()
    var body: some View {
        VStack(spacing:0) {
            ForEach(0..<board.height, id:\.self){x in
                HStack{
                    ForEach(0..<board.width, id:\.self){y in
                        ZStack{
                            Rectangle()
                                .fill(board.grids[x][y].color)
                            Circle()
                                .fill(board.grids[x][y].token)
                                .padding()
                              
                        }
                        .onTapGesture {
                            board.select(grid: board.grids[x][y])
                        }
                       
                    }
                }
            }
        }

    }
}
