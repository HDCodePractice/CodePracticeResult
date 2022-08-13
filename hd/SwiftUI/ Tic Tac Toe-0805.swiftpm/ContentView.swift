// ------Stack------
// VStack
// HStack
// ZStack
// ------ Shape -----
// Rectangle
// Circle
// RoundedRectangle
// Capsule
// Ellipse
// ----- Modifier ---
// fill
// .stroke(.yellow, lineWidth: 20)
// ----- View ----
// Text
// .font
// .foregroundColor

// Homework:
// 1.完成TTT，点一个格子，在没chess和x和o之间来回切换
// 2. Battleship， 10x10格子，放五条船进去，分别是2/3/4/5/6的长度，颜色不同。点一个格子，如果它里边是船，哪么将这个船的格子显示出来。 

import SwiftUI

struct ContentView: View {
    @State var board : [[[String]]] = [
        [["","0","0"],["","0","1"],["","0","2"]],
        [["","1","0"],["","1","1"],["","1","2"]],
        [["","2","0"],["","2","1"],["","2","2"]]
    ]
    
    @State var step = true
    
    @State var isGameOver = true
    
    var body: some View {
        ZStack{
            VStack(spacing:0){
                ForEach(board,id:\.self){ row in
                    HStack(spacing:0){
                        ForEach(row,id:\.self){ grid in
                            ZStack{
                                Rectangle()
                                    .fill(.black)
                                Rectangle()
                                    .stroke(lineWidth: 5)
                                if grid[0]=="o"{
                                    Circle()
                                        .fill(.mint)
                                        .padding()
                                }else if grid[0]=="x"{
                                    Circle()
                                        .stroke(lineWidth: 20)
                                        .fill(.green)
                                        .padding(20)
                                }
                            }
                            .onTapGesture {
                                let x = Int(grid[1])!
                                let y = Int(grid[2])!
                                
                                if board[x][y][0]==""{
                                    if step{
                                        board[x][y][0]="o"
                                    }else{
                                        board[x][y][0]="x"
                                    }
                                    step.toggle()
                                }
                            }
                        }
                    }
                }
            }
            if isGameOver {
                Text("GameOver!")
                    .font(.largeTitle)
                    .foregroundColor(.red)
            }
        }
    }
}
