import SwiftUI

struct ContentView: View {
    @State var board = [[0,0,0],[0,0,0],[0,0,0]]
    @State var isFirst = true
    @State var win = false
    @State var winner = 0
    var body: some View {
        VStack{
            HStack{
                Text("Player:")
                Image(systemName: isFirst ? "circle" : "pencil.slash")
                    .foregroundColor(.accentColor)
            }
            
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
                                    withAnimation(.linear(duration: 2)) { 
                                        if board[row][column]==0&&win==false {
                                            if isFirst{
                                                board[row][column]=1
                                            }else{
                                                board[row][column]=2
                                            }
                                            
                                        }
                                    }
                                    if board[row][0] != 0&&board[row][0]==board[row][1]&&board[row][1]==board[row][2] {
                                        win = true
                                        }
                                    if board[0][column] != 0&&board[0][column]==board[1][column]&&board[1][column]==board[2][column] {
                                        win = true
                                    }
                                    if board[0][0] != 0&&board[1][1]==board[0][0]&&board[1][1]==board[2][2] {
                                        win = true
                                    }
                                    if board[0][2] != 0&&board[0][2]==board[1][1]&&board[1][1]==board[2][0] {
                                        win = true
                                    }
                                    isFirst.toggle()
                                    if win == true{
                                        
                                        if isFirst{
                                            winner=2
                                        }else{
                                            winner=1
                                        }
                                    }
                                    
                                    
                                    }
                            }
                        }
                    }
                }
                if win{
                    Rectangle()
                        .fill(.black)
                        
                }
                HStack{
                    if win{
                        
                        if winner==1{
                            Text("Winner:")
                                .font(.largeTitle)
                                .foregroundColor(.accentColor)
                            Image(systemName:"circle")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.accentColor)
                                .frame(width:100,height:100)
                        }else if winner==2{
                            Text("Winner:")
                                .font(.largeTitle)
                                .foregroundColor(.accentColor)
                            Image(systemName:"pencil.slash")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.accentColor)
                                .frame(width:100,height:100)
                        }
                    }
                }
            }
            Button("Restart Game"){
                withAnimation(.linear(duration: 2)) { 
                    board = [[0,0,0],[0,0,0],[0,0,0]]
                    isFirst = true
                    winner = 0
                    win = false
                }
            }
        }
        .padding()
    }
}
