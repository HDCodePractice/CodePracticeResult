import SwiftUI

struct ContentView: View {
    @State var board = Array(
        repeating: Array(repeating: 0, count: 9), 
        count: 9)
    @State var inputBoard = Array(
        repeating: Array(repeating: 0, count: 9), 
        count: 9)
    
    @State var colors : [[Color]] = Array(
        repeating: Array(repeating: .primary, count: 9), 
        count: 9)
    
    @State var x = 0
    @State var y = 0
    
    func startGame(){
        board = Array(repeating: Array(repeating: 0, count: 9), count: 9)
        inputBoard = Array(repeating: Array(repeating: 0, count: 9), count: 9)
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
        x = row
        y = colum
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
                                                if board[r][c]==0 {
                                                    var isr = false
                                                    ForEach(0..<9, id:\.self){i in
                                                        if board[r][i] == inputBoard[r][c]{
                                                            isr == true
                                                        }
                                                    }
                                                    ForEach(0..<9, id:\.self){i in
                                                        if board[i][c] == inputBoard[r][c]{
                                                            isr == true
                                                        }
                                                    }
                                                    if isr == true{
                                                        Text(inputBoard[r][c]==0 ? "" : String(inputBoard[r][c]))
                                                            .foregroundColor(.red)
                                                        colors[r][c] = Color.pink
                                                    }else{
                                                    Text(inputBoard[r][c]==0 ? "" : String(inputBoard[r][c]))
                                                        .foregroundColor(.blue)
                                                    }
                                                }else{
                                                    Text("\(board[r][c])")
                                                        .foregroundColor(.accentColor)
                                                }
                                            }
                                            .onTapGesture {
                                                tapItem(row: r, colum: c)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .onAppear{
                startGame()
            }
            HStack{
                ForEach(1...9,id:\.self){num in
                    ZStack{
                        RoundedRectangle(cornerRadius: 5)
                            .frame(height: 50)
                        Button("\(num)"){
                            inputBoard[x][y] = num
                        }
                    }
                }
            }
            HStack{
                Button("Erase"){
                    inputBoard[x][y] = 0
                }
                Button("Restart"){
                    startGame()
                }
            }
        }
        .padding()
    }
}
