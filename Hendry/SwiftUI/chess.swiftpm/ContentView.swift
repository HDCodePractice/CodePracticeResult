import SwiftUI
var str : [String] = ["a","b","c","d","e","f","g","h"]
var int : [Int] = [8,7,6,5,4,3,2,1]
struct ContentView: View {
    @State var board = Board()
    var body: some View {
        VStack(spacing:0) {
            ForEach(0..<board.height,id:\.self){ x in
              HStack(spacing:0){
                    Text(int[x])
                    ForEach(0..<board.width,id:\.self){ y in
                        Text(str[y])
                        ZStack{
                            Rectangle()
                                .fill(board.grids[x][y].color)
                        }
                        .onTapGesture {
                            board.select(grid: board.grids[x][y])
                        }
                    }
                }
            }
        }
        .padding()
    }
}

