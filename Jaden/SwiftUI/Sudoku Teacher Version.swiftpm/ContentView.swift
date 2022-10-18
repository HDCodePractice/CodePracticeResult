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
    @State var conflicts : [[Bool]] = Array(
        repeating: Array(repeating: false, count: 9), 
        count: 9)
    
    @State var x = 0
    @State var y = 0
    
    func startGame(){
        board = Array(repeating: Array(repeating: 0, count: 9), count: 9)
        inputBoard = Array(repeating: Array(repeating: 0, count: 9), count: 9)
        conflicts = Array(repeating: Array(repeating: false, count: 9), count: 9)
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
    
    
    
    
    
    func checkConflict(row:Int,colum:Int){
        let inputNum = inputBoard[row][colum]
        for i in 0...8{
            if inputBoard[row][i]==inputNum && inputBoard[row][i] != 0{
                print("hhhh")
                print(conflicts[row][i],i,row,conflict[row][i])
                conflicts[row][i] = true
                conflict[row][i] = inputNum
            }
            if board[row][i] == inputNum && board[row][i] != 0{
                print("ddddd")
                print(conflicts[row][i],i,row,conflict[row][i])
                conflicts[row][i] = true
                conflict[row][i] = inputNum
                
            }
        }
        
        for i in 0...8{
            if inputBoard[i][colum]==inputNum && inputBoard[i][colum] != 0{
                print(conflicts[i][colum],i,colum,conflict[i][colum])
                print("kkkk")
                conflicts[i][colum] = true
                conflict[i][colum] = inputNum
            }
            if board[i][colum] == inputNum && board[i][colum] != 0{
                print(conflicts[i][colum],i,colum,conflict[i][colum])
                print("llllll")
                conflicts[i][colum] = true
                conflict[i][colum] = inputNum
                
            }
        }
        
        let chunkRow = row/3
        let chunkColumn = colum/3
        for x in chunkRow*3..<chunkRow*3+3{
            for y in chunkColumn*3..<chunkColumn*3+3{
                if inputBoard[x][y]==inputNum && inputBoard[x][y] != 0{
                    print("eeeeeee")
                    print(conflicts[x][y],x,y,conflict[x][y],inputBoard[x][y])
                    conflicts[x][y] = true
                    conflict[x][y] = inputNum
                }
                if board[x][y] == inputNum && board[x][y] != 0{
                    print("ssssssss")
                    print(conflicts[x][y],x,y,conflict[x][y])
                    conflicts[x][y] = true
                    conflict[x][y] = inputNum
                }
            }
        }
        
        
        for i in 0..<conflict.count{
            for j in 0..<conflict.count{
                print("klklkkl",conflicts[i][j],i,j,conflict[i][j])
                if conflict[i][j] != 0 && conflicts[i][j] == true{
                    print("yeahhh")
                    colors[i][j] = .red
                }
            }
        }
    }
    
    func tapItem(row:Int,colum:Int){
        colors = Array(
            repeating: Array(repeating: .primary, count: 9), 
            count: 9)
        
        let chunkRow = row/3
        let chunkColumn = colum/3
        for x in chunkRow*3..<chunkRow*3+3{
            for y in chunkColumn*3..<chunkColumn*3+3{
                colors[x][y] = .secondary
            }
        }
        for i in 0...8{
            colors[row][i] = .secondary
            colors[i][colum] = .secondary
        }
        checkConflict(row:row,colum:colum)
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
                                                        .foregroundColor(.yellow)
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
                        }.buttonStyle(.borderedProminent) 
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
