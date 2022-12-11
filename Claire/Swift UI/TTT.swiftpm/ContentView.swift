import SwiftUI

struct ContentView: View {
    @State var board = [[0,0,0],[0,0,0],[0,0,0]]
    @State var isFirst = true
    @State var playerWin = 0
    
    
    
    var body: some View {
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
                                    withAnimation(.linear(duration: 2)) { 
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
                            }
                        }
                    }
                }
                if playerWin == 0{
                    withAnimation(.linear(duration: 2)){
                        HStack{
                            Text("Player")
                            Image(systemName: "circle")
                            Text("WON")
                        }
                    }
                } else if playerWin == 1{
                    withAnimation(.linear(duration: 2)){
                        HStack{
                            Text("Player")
                            Image(systemName: "pencil.slash")
                            Text("WON")
                        }
                    }
                }
            }
            Button("Restart Game"){
                withAnimation(.linear(duration: 2)) { 
                    board = [[0,0,0],[0,0,0],[0,0,0]]
                    isFirst = true
                }
            }
        }
        .padding()
    }
}
