import SwiftUI
struct ContentView: View {
    @State var board : [[[String]]] = [
        [["","0","0","0"],["","0","1","0"],["","0","2","0"]],
        [["","1","0","0"],["","1","1","0"],["","1","2","0"]],
        [["","2","0","0"],["","2","1","0"],["","2","2","0"]]
    ]
    @State var step = true
    @State var frame : CGFloat = 0
    var body: some View {
        VStack(spacing:0){
            ForEach(board,id:\.self){ row in
                HStack(spacing:0){
                    ForEach(row,id:\.self){ grid in
                        ZStack{
                            Rectangle()
                                .stroke(lineWidth: 5)
                            if grid[0]=="o"{
                                Circle()
                                    .fill(.mint)
                                    .frame(width: CGFloat(grid[4]), height: CGFloat(grid[4]))
                            }else if grid[0]=="x"{
                                Circle()
                                    .fill(.green)
                                    .frame(width: CGFloat(grid[4]), height: CGFloat(grid[4]))
                            }
                        .onTapGesture {
                            let x = Int(grid[1])!
                            let y = Int(grid[2])!
                            if board[x][y][0]==""{
                                withAnimation(.easeIn(duration: 2.0)){
                                if step{
                                    board[x][y][0]="o"
                                    board[x][y][4]="125"
                                }else{
                                    board[x][y][0]="x"
                                    board[x][y][4]="125"
                                }
                                step.toggle()
                            }
                            }
                        }
                    }
                }
            }
        }
    }
}
}

