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
    @State var conflict : [[Int]] = Array(
        repeating: Array(repeating: 0, count: 9), 
        count: 9)
    @State var x = 0
    @State var y = 0
    func conflictChecker(){
        
    }
    func checkConflict(row:Int,colum:Int){
        let inputNumber = inputBoard[row][colum]
        var ifColor = false
        for i in 0...8{
            if inputBoard[row][i]==inputNumber && inputBoard[row][i] != 0{
                if colum != i{
                    conflict[row][i] = inputNumber
                    ifColor = true
                }
            }
            if board[row][i]==inputNumber && board[row][i] != 0{
                if colum != i{
                    conflict[row][i] = inputNumber
                    ifColor = true
                }
            }
        }
        for i in 0...8{
            if inputBoard[i][colum]==inputNumber && inputBoard[i][colum] != 0{
                if i != row{
                    conflict[i][colum] = inputNumber
                    ifColor = true
                }
            }
            if board[i][colum]==inputNumber && board[i][colum] != 0{
                if i != row{
                    conflict[i][colum] = inputNumber
                    ifColor = true
                }
            }
        }
        for i in 0...2{
            for j in 0...2{
                if inputBoard[row/3*3+i][colum/3*3+j] == inputNumber && inputNumber != 0 {
                    if row/3*3+i != row{
                        if colum/3*3+j != colum{
                            conflict[row/3*3+i][colum/3*3+j] = inputNumber
                            ifColor = true
                        }
                    }
                    
                }
                if board[row/3*3+i][colum/3*3+j] == inputNumber && inputNumber != 0 {
                    if row/3*3+i != row{
                        if colum/3*3+j != colum{
                            conflict[row/3*3+i][colum/3*3+j] = inputNumber
                            ifColor = true
                        }
                    }
                    
                }
            }
        }
        if ifColor{
            conflict[row][colum] = inputNumber
        }
        for i in 0..<conflict.count{
            for j in 0..<conflict.count{
                if conflict[i][j] != 0{
                    colors[i][j] = .pink
                }
            }
        }
    }
    func startGame(){
        board = Array(repeating: Array(repeating: 0, count: 9), count: 9)
        inputBoard = Array(repeating: Array(repeating: 0, count: 9), count: 9)
        conflict = Array(repeating: Array(repeating: 0, count: 9), count: 9)
        colors = Array(repeating: Array(repeating: .primary, count: 9), count: 9)
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
        let chunkRow = row/3
        let chunkColum = colum/3
        for x in chunkRow*3..<chunkRow*3+3{
            for y in chunkColum*3..<chunkColum*3+3{
                colors[x][y] = .secondary
            }
        }
        for i in 0...8{
            colors[row][i] = .secondary
            colors[i][colum] = .secondary
        }
        checkConflict(row: row, colum: colum)
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
                                                    Text(inputBoard[r][c]==0 ? "" : String(inputBoard[r][c]))
                                                        .foregroundColor(.blue)
                                                }else{
                                                    Text("\(board[r][c])")
                                                        .foregroundColor(.black)
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
                            tapItem(row: x, colum: y)
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
