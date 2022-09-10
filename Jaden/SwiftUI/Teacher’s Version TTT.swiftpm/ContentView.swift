import SwiftUI

struct ContentView: View {
    @State var board = [[0,0,0],[0,0,0],[0,0,0]]
    @State var isFirst = true
    @State var outcome = ""
    func checkTie()->Bool{
        for row in board{
            if row.contains(0){
                return false
            }
        }
        return true
    }
    func checkWin(player: Int)->Bool{
        let checkList = [
            [[0,0],[0,1],[0,2]],
            [[1,0],[1,1],[1,2]],
            [[2,0],[2,1],[2,2]],
            [[0,0],[1,0],[2,0]],
            [[0,1],[1,1],[2,1]],
            [[0,2],[1,2],[2,2]],
            [[0,0],[1,1],[2,2]],
            [[0,2],[1,1],[2,0]]
        ]
        for checks in checkList{
            if board[checks[0][0]][checks[0][1]] == player && board[checks[1][0]][checks[1][1]] == player && board[checks[2][0]][checks[2][1]] == player{
                return true
            }
        }
        return false
    }
    var body: some View {
        VStack{
            HStack{
                Text("Player:")
                Image(systemName: isFirst ? "circle" : "pencil.slash")
                    .foregroundColor(.accentColor)
                Text(outcome)
                
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
                                    withAnimation(.linear(duration: 0.5)) { 
                                        if outcome == ""{
                                            if board[row][column]==0{
                                                
                                                if isFirst{
                                                    board[row][column]=1
                                                }else{
                                                    board[row][column]=2
                                                }
                                                isFirst.toggle()
                                            }
                                        }
                                        if checkWin(player: board[row][column]) == true{
                                            if board[row][column] == 1{
                                                outcome = "Player O Wins!"
                                            }else{
                                                outcome = "Player X Wins!"
                                            }
                                            
                                        }else if checkTie() == true{
                                            if outcome == ""{
                                                outcome = "It's A Tie"
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            Button("Restart Game"){
                withAnimation(.linear(duration: 0.5)) { 
                    board = [[0,0,0],[0,0,0],[0,0,0]]
                    isFirst = true
                    outcome = ""
                }
            }
        }
        .padding()
    }
}
