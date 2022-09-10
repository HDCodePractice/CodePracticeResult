import SwiftUI

struct ContentView: View {
    @State var board = [[0,0,0],[0,0,0],[0,0,0]]
    @State var ending = ""
    @State var isFirst = true
    func checkWin(){
        for i in 1...2{
            if board.contains([i,i,i]){
                if i == 1{
                    ending = "Player O Wins!"
                }else{
                    ending = "Player X Wins!"
                }
            }else if board[0][0] == i && board[1][0] == i && board[2][0] == i{
                if i == 1{
                    ending = "Player O Wins!"
                }else{
                    ending = "Player X Wins!"
                }
            }else if board[0][1] == i && board[1][1] == i && board[2][1] == i{
                if i == 1{
                    ending = "Player O Wins!"
                }else{
                    ending = "Player X Wins!"
                }
            }else if board[0][2] == i && board[1][2] == i && board[2][2] == i{
                if i == 1{
                    ending = "Player O Wins!"
                }else{
                    ending = "Player X Wins!"
                }
            }else if board[0][0] == i && board[1][1] == i && board[2][2] == i{
                if i == 1{
                    ending = "Player O Wins!"
                }else{
                    ending = "Player X Wins!"
                }
            }else if board[0][2] == i && board[1][1] == i && board[2][0] == i{
                if i == 1{
                    ending = "Player O Wins!"
                }else{
                    ending = "Player X Wins!"
                }
            }else if !board[0].contains(0) && !board[1].contains(0) && !board[2].contains(0) {
                if ending == ""{
                    ending = "It's a tie"
                }
            }
        }
        
    }
    var body: some View {
        VStack{
            HStack{
                Text("Player:")
                Image(systemName: isFirst ? "circle" : "pencil.slash")
                    .foregroundColor(.accentColor)
                
                Text("\(ending)")
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
                                    withAnimation() {
                                        if ending == ""{
                                            if board[row][column]==0{
                                                if isFirst{
                                                    board[row][column]=1
                                                }else{
                                                    board[row][column]=2
                                                }
                                                isFirst.toggle()
                                            }
                                        }
                                        
                                    }
                                    checkWin()
                                }
                            }
                        }
                    }
                }
            }
            Button("Restart Game"){
                withAnimation(.easeInOut(duration: 2)) { 
                    board = [[0,0,0],[0,0,0],[0,0,0]]
                    isFirst = true
                    ending = ""
                }
            }
        }
        .padding()
    }
}
