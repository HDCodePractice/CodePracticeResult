import SwiftUI

struct ContentView: View {
    @State var board = Board()
    var body: some View {
        VStack(spacing:0){
            ForEach(0..<board.height,id:\.self){ x in
                HStack(spacing:0){
                    ForEach(0..<board.width,id:\.self){ y in
                        ZStack{
                            Rectangle()
                                .fill(board.grids[x][y].color)
                            ZStack{
                                Circle()
                                    .stroke(lineWidth: 15)
                                    .fill(board.grids[x][y].token == .clear ? .clear : .black)
                                Circle()
                                    .fill(board.grids[x][y].token)
                            }
                            .padding(10)
                        }
                        .onTapGesture {
                            board.selectGrid(grid: board.grids[x][y])
                        }
                    }
                }
            }
        }
    }
}
