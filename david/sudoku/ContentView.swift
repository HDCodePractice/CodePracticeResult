import SwiftUI

struct ContentView: View {
    @State var grid : [[Int]] = Array(
        repeating: Array(repeating: 0, count: 9), 
        count: 9)
    @State var inputGrid : [[Int]] = Array(
        repeating: Array(repeating: 0, count: 9), 
        count: 9)
    @State var backgrounds : [[Color]] = Array(
        repeating: Array(repeating: .white, count: 9), 
        count: 9)
    
    @State var row : Int = 0
    @State var column : Int = 0
    let myBackground = Color(red: 29/255, green: 142/255, blue: 238/255)
    
    func gridInit(){
        grid = Array(
            repeating: Array(repeating: 0, count: 9), 
            count: 9)
        inputGrid = Array(
            repeating: Array(repeating: 0, count: 9), 
            count: 9)
        backgrounds = Array(
            repeating: Array(repeating: .white, count: 9), 
            count: 9)
        var numbers : [Int] = [1,2,3,4,5,6,7,8,9]
        let starts : [Int] = [0,3,6]
        
        for start in starts{
            numbers.shuffle()
            for i in 0...2{
                for j in 0...2{
                    grid[i+start][j+start]=numbers[i*3+j]
                }
            }
        }
    }
    
    func backgroundsInit(){
        backgrounds = Array(
            repeating: Array(repeating: .white, count: 9), 
            count: 9)
    }
    
    func tapItem(row:Int,column:Int){
        backgroundsInit()
        for i in 0...8{
            backgrounds[row][i] = myBackground
            backgrounds[i][column] = myBackground
        }
        for i in 0...2{
            for j in 0...2{
                backgrounds[row/3*3+i][column/3*3+j] = myBackground
            }
        }
        if inputGrid[row][column] != 0{
            for i in 0...8{
                // check row
                if grid[row][i]==inputGrid[row][column] || inputGrid[row][i]==inputGrid[row][column]{
                    backgrounds[row][i] = .red
                }
                // check column
                if grid[i][column]==inputGrid[row][column] || inputGrid[i][column]==inputGrid[row][column]{
                    backgrounds[i][column] = .red
                }
                
            }
            // check chunk
            for i in 0...2{
                for j in 0...2{
                    let r = row/3*3+i
                    let c = column/3*3+j
                    if grid[r][c]==inputGrid[row][column] || inputGrid[r][c]==inputGrid[row][column]{
                        backgrounds[r][c] = .red
                    }
                }
            }
        }
        
        backgrounds[row][column] = Color.indigo
    }
    
    func startGame(){
        gridInit()
        backgroundsInit()
        row = 4
        column = 2
        tapItem(row: row, column: column)
    }
    
    var body: some View {
        VStack{
            ZStack{
                Color.black
                VStack(spacing:3){
                    ForEach(0..<3,id:\.self){ row1 in
                        HStack(spacing:3){
                            ForEach(0..<3,id:\.self){ column1 in
                                VStack(spacing:1){
                                    ForEach(0..<3,id:\.self){ row2 in
                                        HStack(spacing:1){
                                            ForEach(0..<3,id:\.self){ column2 in
                                                let r : Int = row1*3+row2
                                                let c : Int = column1*3+column2
                                                ZStack{
                                                    Rectangle()
                                                        .fill(backgrounds[r][c])
                                                    Text("\(grid[r][c]==0 ? inputGrid[r][c]==0 ? "" : String(inputGrid[r][c]) : String(grid[r][c]))")
                                                        .font(.largeTitle)
                                                }
                                                .onTapGesture {
                                                    column = c
                                                    row = r
                                                    tapItem(row: row, column: column)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                .padding(3)
            }
            .onAppear{
                startGame()
            }
            HStack{
                Button("Erase"){
                    grid[row][column]=0
                }
                .font(.largeTitle)
                .buttonStyle(.bordered)
                Button("Reset"){
                    startGame()
                }
                .font(.largeTitle)
                .buttonStyle(.bordered)
                
            }
            HStack{
                ForEach(1...9,id:\.self){ num in
                    Button("\(num)"){
                        if grid[row][column]==0{
                            inputGrid[row][column]=num
                            tapItem(row: row, column: column)
                        }
                    }
                    .font(.largeTitle)
                    .buttonStyle(.bordered)
                }
            }
        }
        .padding()
        
    }
}
