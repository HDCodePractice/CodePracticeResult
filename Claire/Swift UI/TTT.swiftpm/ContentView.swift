import SwiftUI

struct ContentView: View {
    @State var board : [[[String]]] = [
        [["","0","0"],["","0","1"],["","0","2"]],
        [["","1","0"],["","1","1"],["","1","2"]],
        [["","2","0"],["","2","1"],["","2","2"]]
    ]
    
    var body: some View {
        VStack {
            ForEach(board,id:\.self){ row in
                HStack{
                    ForEach(row,id:\.self){ grid in
                        ZStack{
                            Rectangle()
                                .stroke(lineWidth: 5)
                            if grid[0]=="o"{
                                Circle()
                                    .fill(.mint)
                                    .padding
                            } else if grid[0]=="x"{
                                Circle()
                                    .stroke(lineWidth:20)
                                    .fill(.black)
                                    .padding(20)
                            }
                        }
                        .onTapGesture{
                            let x = Int(grid[1])!
                            let y = Int(grid[2])!
                            if board[x][y] == ["o"]{
                                board[x][y]=[""]
                            } else if board[x][y] == ["x"]{
                                board[x][y]=["o"]
                            } else if board[x][y] == [""]{
                                board[x][y]=["x"]
                            }
                            
                        }
                    }
                }
            }
        }
    }
}
