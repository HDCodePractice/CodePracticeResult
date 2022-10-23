import SwiftUI

struct ContentView: View {
    @State var board = [
        [1,2,3,4,5,6,7,8,9],
        [2,2,3,4,5,6,7,8,9],
        [3,2,3,4,5,6,7,8,9],
        [4,2,3,4,5,6,7,8,9],
        [5,2,3,4,5,6,7,8,9],
        [6,2,3,4,5,6,7,8,9],
        [7,2,3,4,5,6,7,8,9],
        [8,2,3,4,5,6,7,8,9],
        [9,2,3,4,5,6,7,8,9]
    ]
    
    @State var colors : [[Color]] = Array(
        repeating: Array(repeating: .primary, count: 9), 
        count: 9)
    @State var tColors : [[Color]] = Array(
        repeating: Array(repeating: .accentColor, count: 9), 
        count: 9)
    
    @State var x = 0
    @State var y = 0
    
    func startGame(){
        board = Array(repeating: Array(repeating: 0, count: 9), count: 9)
        var random = [1,2,3,4,5,6,7,8,9]
        let grids = [0,3,6]
        for g in grids{
            random.shuffle()
            for i in 0...2{
                for j in 0...2{
                    board[i+g][j+g] = random[i*3+j]
                }
            }
        }
    }
    
    func tapItem(row:Int,colum:Int){
        colors = Array(
            repeating: Array(repeating: .primary, count: 9), 
            count: 9)
        for i in 0...8{
            colors[row][i] = .secondary
            colors[i][colum] = .secondary
        }
        colors[row][colum] = .mint
    }
    
    var body: some View {
        VStack(spacing: 20){
            VStack(spacing: 4){
                ForEach(0..<3,id:\.self){row1 in
                    HStack(spacing: 4){
                        ForEach(0..<3,id:\.self){column1 in
                            VStack(spacing: 2){
                                ForEach(0..<3,id:\.self){row2 in
                                    HStack(spacing: 2){
                                        ForEach(0..<3,id:\.self){column2 in
                                            let r : Int = row1*3+row2
                                            let c : Int = column1*3+column2
                                            ZStack{
                                                Rectangle()
                                                    .fill(colors[r][c])
                                                if board[r][c] != 0{
                                                    Text("\(board[r][c])")
                                                        .foregroundColor(tColors[r][c])
                                                }
                                            }
                                            .onTapGesture {
                                                tapItem(row: r, colum: c)
                                                x = r
                                                y = c
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            HStack{
                ForEach(1...9,id:\.self){num in
                    ZStack{
                        RoundedRectangle(cornerRadius: 5)
                            .frame(height: 50)
                        Button("\(num)"){
                            board[x][y] = num
                            tColors[x][y] = .blue
                        }
                    }
                }
            }
            Button("Erase"){
                board[x][y] = 0
            }
            Button("Restart"){
                startGame()
            }
        }
        .padding()
    }
}
