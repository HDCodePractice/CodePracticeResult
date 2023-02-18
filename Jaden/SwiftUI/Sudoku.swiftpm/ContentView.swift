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
        [9,2,3,4,5,6,7,8,9],
    ]
    
    @State var random = [1,2,3,4,5,6,7,8,9]
    @State var inputBoard = Array(
        repeating: Array(repeating: 0, count: 9), 
        count: 9)
    @State var color : [[Color]] = Array(repeating: Array(repeating: .primary, count: 9), count: 9)
    @State var error = false
    func startGame(){
        random = [1,2,3,4,5,6,7,8,9]
        board = Array(repeating: Array(repeating: 0, count: 9), count: 9)
        inputBoard = Array(repeating: Array(repeating: 0, count: 9), count: 9)
        for i in 0...2{
            for j in 0...2{
                random.shuffle()
                board[i][j] = random[0]
                inputBoard[i][j] = board[i][j]
                random.remove(at: 0)
            }
        }
        random = [1,2,3,4,5,6,7,8,9]
        for i in 3...5{
            for j in 3...5{
                random.shuffle()
                board[i][j] = random[0]
                inputBoard[i][j] = board[i][j]
                random.remove(at: 0)
            }
        }
        random = [1,2,3,4,5,6,7,8,9]
        for i in 6...8{
            for j in 6...8{
                random.shuffle()
                board[i][j] = random[0]
                inputBoard[i][j] = board[i][j]
                random.remove(at: 0)
            }
        }
    }
    
    func tapItem(row:Int, column: Int){
        color = Array(repeating: Array(repeating: .primary, count: 9), count: 9)
        
        for i in 0..<9{
            color[i][column] = .cyan
            color[row][i] = .cyan
        }

        
    }
    func checkSquare(row: Int, column: Int ){
        for k in 0...2{
            for l in 0...2{
                color[row+k][column+l] = .cyan
            }
        }
    }
    func clicked(row: Int, column: Int){
        if error == true {
            color[row][column] = .red
        }else{
            color[row][column] = .mint
        }
    }
    
    var body: some View {
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
                                                .fill(color[r][c])
                                            if board[r][c]==0 {
                                                Text(inputBoard[r][c]==0 ? "" : String(inputBoard[r][c]))
                                                    .foregroundColor(.blue)
                                            }else{
                                                Text("\(board[r][c])")
                                                    .foregroundColor(.yellow)
                                            }
                                            
                                        }
                                        .onTapGesture {
                                            error = false
                                            tapItem(row: r, column: c)
                                            checkSquare(row: row1*3, column: column1*3)
                                            clicked(row: r, column: c)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            VStack{
                HStack{
                    ForEach(0...9, id:\.self){ h in 
                        if h != 0{
                            Button(String(h)){
                                var x = 10
                                var row = 0
                                var column = 0
                                var y = 0
                                var z = 0
                                for i in 0...8{
                                    if i >= 0 && i <= 2{
                                        row = 0
                                    }else if i >= 3 && i <= 5{
                                        row = 1
                                    }else{
                                        row = 2
                                    }
                                    for j in 0...8{
                                        if j >= 0 && j <= 2{
                                            column = 0
                                        }else if j >= 3 && j <= 5{
                                            column = 1
                                        }else{
                                            column = 2
                                        }
                                        if color[i][j] == .mint || color[i][j] == .red{
                                            inputBoard[i][j] = h
                                            x = inputBoard[i][j]
                                            y = i 
                                            z = j
                                            print(color[i][j], y , z)
                                            print(inputBoard[i][j])
                                            print(x)
                                            error = false
                                            tapItem(row: i, column: j)
                                            checkSquare(row: row*3, column: column*3)
                                            clicked(row: i, column: j)
                                            
                                        }
                                        
                                    }
                                }
                                for i in 0...8{
                                    if y >= 0 && y <= 2{
                                        row = 0
                                    }else if y >= 3 && y <= 5{
                                        row = 1
                                    }else{
                                        row = 2
                                    }
                                    for j in 0...8{
                                        if z >= 0 && z <= 2{
                                            column = 0
                                        }else if z >= 3 && z <= 5{
                                            column = 1
                                        }else{
                                            column = 2
                                        }
                                        if color[i][j] == .cyan{
                                            print(inputBoard[i][j],color[i][j])
                                            if board[i][j] == x{
                                                print("error",x,board[i][j])
                                                error = true
                                                tapItem(row: y, column: z)
                                                checkSquare(row: row*3, column: column*3)
                                                clicked(row: y, column: z)
                                                
                                                
                                            }
                                        }
                                    }
                                }
                            }.buttonStyle(.borderedProminent) 
                            
                        }
                    }
                }
                HStack{
                    Button("Start Game"){
                        error = false
                        startGame()
                    }.buttonStyle(.borderedProminent) 
                    Button("Erase"){
                        for i in 0...8{
                            for j in 0...8{
                                if color[i][j] == .mint || color[i][j] == .red{
                                    if inputBoard[i][j] != 0{
                                        inputBoard[i][j] = 0
                                    }
                                }
                            }
                        }
                    }.buttonStyle(.borderedProminent) 
                }
                
                
            }
        }
        .onAppear{
            startGame()
        }
        .padding()
    }
}
