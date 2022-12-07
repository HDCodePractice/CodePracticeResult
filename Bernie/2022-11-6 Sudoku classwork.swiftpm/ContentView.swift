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
    @State var count = 0
    
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
    
    func putNumberToGrid(putGrids:[[Int]])->Bool{
        // print(putGrids)
        if let g=putGrids.first{
            let r = g[0]
            let c = g[1]
            let numbers = getPossibleNumbers(row: r, column: c)
            for number in numbers {
                print("put",number,r,c)
                if putAvailableNumber(number: number, row: r, column: c){
                    var lastGrids = putGrids
                    lastGrids.removeFirst()
                    if lastGrids.isEmpty{
                        return true
                    }
                    if putNumberToGrid(putGrids: lastGrids){
                        return true
                    }
                }
            }
            return false
        }        
        return false
    }
    
    // 放一个number进row/column，如果成功返回true
    func putAvailableNumber(number: Int, row: Int, column: Int) -> Bool{
        count += 1
        inputGrid[row][column] = number
        if isClash(row: row, column: column) {
            return false
        }
        return true
    }
    
    // 使用可用的数字，放入当前格子，并不冲突。如果所有的数字都放不进去，返回false
    func putAvailableNumber(row: Int, column: Int) -> Bool{
        let possibleNumbers = getPossibleNumbers(row: row, column: column)
        for i in possibleNumbers{
            if putAvailableNumber(number: i, row: row, column: column) {
                return true
            }
        }
        return false   
    }
    
    // 得到格子可用的数字List
    func getPossibleNumbers(row:Int,column:Int)->[Int]{
        var gridNumbers : [Int] = []
        for i in 0..<9{
            gridNumbers.append(grid[i][column])
            gridNumbers.append(grid[row][i])
        }
        gridNumbers = Array(Set(gridNumbers))
        var possibleNumbers :[Int] = []
        for i in 1...9{
            if !gridNumbers.contains(i){
                possibleNumbers.append(i)
            }
        }
        return possibleNumbers
    }
    
    // 检查是否有冲突，如果冲突返回true
    func isClash(row:Int,column:Int)->Bool{
        if inputGrid[row][column] != 0{
            for i in 0...8{
                // check row
                if i != column{
                    if grid[row][i]==inputGrid[row][column] || inputGrid[row][i]==inputGrid[row][column]{
                        return true
                    }
                }
                // check column
                if i != row{
                    if grid[i][column]==inputGrid[row][column] || inputGrid[i][column]==inputGrid[row][column]{
                        return true
                    }
                }
            }
            // check chunk
            for i in 0...2{
                for j in 0...2{
                    let r = row/3*3+i
                    let c = column/3*3+j
                    if r != row && c != column{
                        if grid[r][c]==inputGrid[row][column] || inputGrid[r][c]==inputGrid[row][column]{
                            return true
                        }
                    }
                }
            }
        }
        return false
    }
    
    // 检查是否有冲突并修改背景
    func checkClash(row:Int,column:Int){
        if inputGrid[row][column] != 0{
            for i in 0...8{
                // check row
                if i != column{
                    if grid[row][i]==inputGrid[row][column] || inputGrid[row][i]==inputGrid[row][column]{
                        backgrounds[row][i] = .red
                        backgrounds[row][column] = .red
                    }
                }
                // check column
                if i != row{
                    if grid[i][column]==inputGrid[row][column] || inputGrid[i][column]==inputGrid[row][column]{
                        backgrounds[i][column] = .red
                        backgrounds[row][column] = .red
                    }
                }
            }
            // check chunk
            for i in 0...2{
                for j in 0...2{
                    let r = row/3*3+i
                    let c = column/3*3+j
                    if r != row && c != column{
                        if grid[r][c]==inputGrid[row][column] || inputGrid[r][c]==inputGrid[row][column]{
                            backgrounds[r][c] = .red
                            backgrounds[row][column] = .red
                        }
                    }
                }
            }
        }
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
        for x in 0..<inputGrid.count{
            for y in 0..<inputGrid.count{
                checkClash(row: x, column: y)
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
                    inputGrid[row][column]=0
                    tapItem(row: row, column: column)
                }
                .font(.largeTitle)
                .buttonStyle(.bordered)
                Button("Reset"){
                    startGame()
                }
                .font(.largeTitle)
                .buttonStyle(.bordered)
                Button("Answer"){
                    count = 0
                    // 0,3 ~ 2,5
                    // 0,3/0,4/0,5/1,3/1,4/1,5/2,3/2,4/2,5
                    var gs : [[Int]] = []
                    for i in 0...2{
                        for j in 3...5{
                            gs.append([i,j])
                        }
                    }
                    let _ = putNumberToGrid(putGrids: gs)
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
