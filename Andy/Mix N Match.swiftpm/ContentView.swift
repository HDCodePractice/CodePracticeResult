import SwiftUI
func genBoard() -> [[Int]]{
    let length = 8
    let height = 8
    var x = 0
    var y = 0
    var board : [[Int]] = []
    for i in 0...height-1{
        board.append([])
        for _ in 0...length-1{
            board[i].append(0)
        }
    }
    for a in 1...length*height/2{
        x = Int.random(in:0...length-1)
        y = Int.random(in:0...height-1)
        while true{
            if board[y][x] == 0{
                board[y][x] = a
                break
            }else{
                x = Int.random(in:0...length-1)
                y = Int.random(in:0...height-1)
            }
        }
        while true{
            if board[y][x] == 0{
                board[y][x] = a
                break
            }else{
                x = Int.random(in:0...length-1)
                y = Int.random(in:0...height-1)
            }
        }
    }
    return board
}
import SwiftUI
struct ContentView: View {
    @State var board : [[Int]] = genBoard()
    var body: some View {
        VStack{
            ZStack{
                Color.black
                VStack(spacing: 2) {
                    ForEach(0..<board.count,id:\.self){ row in
                        HStack(spacing: 2) {
                            ForEach(0..<board[row].count,id:\.self){column in
                                ZStack{
                                    Rectangle()
                                    Image(systemName: "\(board[row][column])\(".circle.fill")")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor(.accentColor)
                                        .padding()
                                }
                                .onTapGesture {
                                    withAnimation(.linear(duration: 2)) { 
                                        if board[row][column] > 0{
                                            
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        .padding()
    }
}
