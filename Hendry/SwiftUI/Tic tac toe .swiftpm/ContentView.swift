
import SwiftUI

struct ContentView: View {
    @State var board = [[0,0,0],[0,0,0],[0,0,0]]
    @State var isFirst = true
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
    func ifWin(check:[[Int]])->Int{
        for i in 0...check.count-1{
            if (check[0][i]==check[1][i]&&check[2][i]==check[1][i])||(check[i][0]==check[i][1]&&check[i][1]==check[i][[2]])||(check[0][0]==check[1][1]&&check[2][2]==check[1][1])||(check[2][0]==check[1][1]&&check[0][2]==check[1][1]){
                return 
            }
        }
    }
}
