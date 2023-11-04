import SwiftUI

struct TicTacToeView: View {
        @State private var showingDog = false
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
        if showingDog == false{
            VStack{
                HStack{
                    Text("Player:")
                    Image(isFirst ? "JPEG image 4" : "JPEG image 5")
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
                                        Image("JPEG image 4")
                                            .resizable()
                                            .scaledToFit()
                                            .foregroundColor(.accentColor)
                                            .padding()
                                            .opacity( board[row][column]==1 ? 1 : 0)
                                            .scaleEffect( board[row][column]==1 ? 1 : 0)
                                        Image("JPEG image 5")
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
                                                    outcome = "Small Puppy Wins!"
                                                }else{
                                                    outcome = "Dog on Bed Wins!"
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
                Button() {
                    showingDog = true
                } label: {
                    ZStack {
                        Color(red: 0, green: 0.8, blue: 0.6)
                        Text("Home")
                            .font(.system(size: 40, design: .rounded))
                            .bold()
                            .foregroundColor(.black)
                            .font(.title)
                    }
                    .cornerRadius(20)
                    .padding()
                    
                }
                
            }
            .padding()
        }

        if showingDog == true{
            HomeView()
        }
    }
}

struct TicTacToeView_Previews: PreviewProvider {
    static var previews: some View {
        TicTacToeView()
    }
}
