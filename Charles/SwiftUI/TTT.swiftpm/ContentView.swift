import SwiftUI

struct ContentView: View {
    @State var board = [[0,0,0],[0,0,0],[0,0,0]]
    @State var isFirst = true
    @State var gameover = 0
    @State var animation = true
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Text("Player:")
                    Image(systemName: isFirst ? "circle" : "pencil.slash")
                        .foregroundColor(.accentColor)
                }
                .font(.largeTitle)
                ZStack{
                    Color.black
                    VStack(spacing: 2) {
                        ForEach(0..<board.count,id:\.self){ row in
                            HStack(spacing: 2) {
                                ForEach(0..<board[row].count,id:\.self){column in
                                    ZStack{
                                        Rectangle()
                                            .fill(.white)
                                        Image(systemName: "circle")
                                            .resizable()
                                            .scaledToFit()
                                            .foregroundColor(.accentColor)
                                            .padding()
                                            .opacity( board[row][column]==1 ? 1 : 0)
                                            .scaleEffect( board[row][column]==1 ? 1 : 0)
                                        Image(systemName: "pencil.slash")
                                            .resizable()
                                            .scaledToFit()
                                            .foregroundColor(.accentColor)
                                            .padding()
                                            .opacity( board[row][column]==2 ? 1 : 0)
                                            .scaleEffect(board[row][column]==2 ? 1 : 0)
                                    }
                                    .onTapGesture {
                                        withAnimation{ 
                                            if board[row][column]==0{
                                                if isFirst{
                                                    board[row][column]=1
                                                }else{
                                                    board[row][column]=2
                                                }
                                                isFirst.toggle()
                                            }
                                        }
                                        if board[0][0]==1 && board[0][1]==1 && board[0][2]==1{
                                            gameover = 1
                                        }
                                        if board[1][0]==1 && board[1][1]==1 && board[1][2]==1{
                                            gameover = 1
                                        }
                                        if board[2][0]==1 && board[2][1]==1 && board[2][2]==1{
                                            gameover = 1
                                        }
                                        if board[0][0]==1 && board[1][0]==1 && board[2][0]==1{
                                            gameover = 1
                                        }
                                        if board[0][1]==1 && board[1][1]==1 && board[2][1]==1{
                                            gameover = 1
                                        }
                                        if board[0][2]==1 && board[1][2]==1 && board[2][2]==1{
                                            gameover = 1
                                        }
                                        if board[0][0]==1 && board[1][1]==1 && board[2][2]==1{
                                            gameover = 1
                                        }
                                        if board[0][2]==1 && board[1][1]==1 && board[2][0]==1{
                                            gameover = 1
                                        }
                                        if board[0][0]==2 && board[0][1]==2 && board[0][2]==2{
                                            gameover = 2
                                        }
                                        if board[1][0]==2 && board[1][1]==2 && board[1][2]==2{
                                            gameover = 2
                                        }
                                        if board[2][0]==2 && board[2][1]==2 && board[2][2]==2{
                                            gameover = 2
                                        }
                                        if board[0][0]==2 && board[1][0]==2 && board[2][0]==2{
                                            gameover = 2
                                        }
                                        if board[0][1]==2 && board[1][1]==2 && board[2][1]==2{
                                            gameover = 2
                                        }
                                        if board[0][2]==2 && board[1][2]==2 && board[2][2]==2{
                                            gameover = 2
                                        }
                                        if board[0][0]==2 && board[1][1]==2 && board[2][2]==2{
                                            gameover = 2
                                        }
                                        if board[0][2]==2 && board[1][1]==2 && board[2][0]==2{
                                            gameover = 2
                                            
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                Button("Restart Game"){
                    withAnimation(.linear(duration: 1)) { 
                        board = [[0,0,0],[0,0,0],[0,0,0]]
                        isFirst = true
                        gameover = 0
                    }
                }
            }
            .padding()
            if gameover == 1{
                Text("Game Over, O wins")
                    .foregroundColor(.blue)
                    .font(.largeTitle)
                    .scaleEffect(animation ? 0.5 : 1.5)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 1)){
                            animation.toggle()
                        }
                    }
            }else if gameover == 2{
                Text("Game Over, X wins")
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                    .scaleEffect(animation ? 0.5 : 1.5)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 1)){
                            animation.toggle()
                        }
                    }
            }
        }
    }
}


