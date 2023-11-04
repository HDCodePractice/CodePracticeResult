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
    
    @State var numClashBackgrounds : [[Color]] = Array(
        repeating: Array(repeating: .white, count: 9), 
        count: 9)
    @State var zGrounds :  [[Color]] = Array(
        repeating: Array(repeating: .white, count: 9), 
        count: 9)
    @State var textColor:  [[Color]] = Array(
        repeating: Array(repeating: Color(red: 65/250, green: 71/250, blue: 95/250), count: 9), 
        count: 9)
    @State var mayEraseNum: Int = 0
    
    func gridInit(){
        grid = Array(
            repeating: Array(repeating: 0, count: 9), 
            count: 9)
        inputGrid  = Array(
            repeating: Array(repeating: 0, count: 9), 
            count: 9)
        backgrounds  = Array(
            repeating: Array(repeating: .white, count: 9), 
            count: 9)
        
        var numbers : [Int] = [1,2,3,4,5,6,7,8,9]
        let starts : [Int] = [0,3,6]
        for start in starts{
            numbers.shuffle()
            for i in 0...2{
                for j in 0...2{
                    grid[i+start][j+start] = numbers[i*3+j]
                }
            }
        }
    }
    
    func backgroundsInit(){
        backgrounds = Array(
            repeating: Array(repeating: .white, count: 9), 
            count: 9)
    }
    
    func numClashBackgroundsInit(){
        numClashBackgrounds = Array(repeating: Array(repeating: .white, count: 9), count: 9)
    }
    
    func zGroundsInit(){
        for i in 0...8{
            for j in 0...8{
                if numClashBackgrounds[i][j] != Color(red: 241/250, green: 208/250, blue: 214/250){
                    zGrounds[i][j] = .white
                }
            }
        }
    }
    
    func tapItem(row:Int,column:Int){
        backgroundsInit()
        for i in 0...8{
            backgrounds[row][i] = Color(red: 228/250, green: 235/250, blue: 242/250) // light blue
            backgrounds[i][column] = Color(red: 228/250, green: 235/250, blue: 242/250) // light blue
        }
        
        for i in 0...2{
            for j in 0...2{
                backgrounds[row/3*3+i][column/3*3+j] = Color(red: 228/250, green: 235/250, blue: 242/250) // light blue
            }
        }
        
        if inputGrid[row][column] != 0{
            for i in 0...8{
                //check row
                if i != column{
                if grid[row][i] == inputGrid[row][column] || inputGrid[row][i] == inputGrid[row][column] {
                    numClashBackgrounds[row][i] = Color(red: 241/250, green: 208/250, blue: 214/250) //red
                    numClashBackgrounds[row][column] = Color(red: 241/250, green: 208/250, blue: 214/250) //red
//                    print("check row \(numClashBackgrounds)")
                }
                }
                // check column
                if i != row{
                if grid[i][column] == inputGrid[row][column] || inputGrid[i][column] == inputGrid[row][column] {
                    numClashBackgrounds[i][column] = Color(red: 241/250, green: 208/250, blue: 214/250) //red
                    numClashBackgrounds[row][column] = Color(red: 241/250, green: 208/250, blue: 214/250) //red
//                    print( "check column \(numClashBackgrounds)")
                }
                }
                //check chunck
                for i in 0...2{
                    for j in 0...2{
                        let r = row/3
                        let c = column/3
//                        print(row/3*3+i,column/3*3+j)
//                        print(r*3+i,c*3+j)
//                        print(row,column)
                        if r*3+i != row && c*3+j != column {
                        if  grid[r*3+i ][c*3+j]==inputGrid[row][column] || inputGrid[r*3+i][c*3+j] == inputGrid[row][column]{
//                            numClashBackgrounds[r][c] = Color(red: 241/250, green: 208/250, blue: 214/250) //red
                            numClashBackgrounds[row][column] = Color(red: 241/250, green: 208/250, blue: 214/250) //red
//                            print( "check chunck \(numClashBackgrounds)")
                        }
                        }
                    }
                } 
                
            }
            
        }
        backgrounds[row][column] = Color(red: 194/250, green: 221/250, blue: 248/250) // darker light blue
    }
    
    func chooseBackground(row:Int,column:Int){
        zGroundsInit()
        for i in 0...8{
            for j in 0...8{
                if backgrounds[i][j] ==  Color(red: 228/250, green: 235/250, blue: 242/250){
                    zGrounds[i][j] = Color(red: 228/250, green: 235/250, blue: 242/250) // light blue
                }
                if numClashBackgrounds[i][j] == Color(red: 241/250, green: 208/250, blue: 214/250){
                    zGrounds[i][j] = Color(red: 241/250, green: 208/250, blue: 214/250) //red
                }
            }
        }

        zGrounds[row][column] = Color(red: 194/250, green: 221/250, blue: 248/250) // darker light blue
        
    }
    
    func chooseTextColor(row:Int,column:Int){
        if inputGrid[row][column] != 0{
            textColor[row][column] = Color(red: 48/250, green: 112/250, blue: 219/250)//blue text

            if numClashBackgrounds[row][column] == Color(red: 241/250, green: 208/250, blue: 214/250){
                                textColor[row][column] = Color(red: 213/250, green: 101/250, blue: 111/250) // red text
                            }
        }
        
    }
    
    func eraseInit(row:Int,column:Int){
        if inputGrid[row][column] != 0{
            mayEraseNum = inputGrid[row][column]
        }
    }
    
    func eraseGrid(row:Int,column:Int){
        
        for i in 0...8{
            //check row
            if i != column{
                if grid[row][i] == mayEraseNum || inputGrid[row][i] == mayEraseNum {
                    numClashBackgrounds[row][i] = .white
                    numClashBackgrounds[row][column] = .white
//                    print("check row \(numClashBackgrounds)")
                }
            }
            // check column
            if i != row{
                if grid[i][column] == mayEraseNum || inputGrid[i][column] == mayEraseNum {
                    numClashBackgrounds[i][column] = .white 
                    numClashBackgrounds[row][column] = .white
//                    print( "check column \(numClashBackgrounds)")
                }
            }
            //check chunck
            for i in 0...2{
                for j in 0...2{
                    let r = row/3
                    let c = column/3
                    //                        print(row/3*3+i,column/3*3+j)
                    //                        print(r*3+i,c*3+j)
                    //                        print(row,column)
                    if r*3+i != row && c*3+j != column {
                        if  grid[r*3+i ][c*3+j]==mayEraseNum || inputGrid[r*3+i][c*3+j] == mayEraseNum{
//                            numClashBackgrounds[r][c] = .white
                            numClashBackgrounds[row][column] = .white
                            print( "check chunck \(numClashBackgrounds)")
                        }
                    }
                }
            } 
            
        }
        inputGrid[row][column] = 0
    }
    
    
    
    func startGame(){
        gridInit()
        backgroundsInit()
        numClashBackgroundsInit()
        zGroundsInit()
        row = 4
        column = 2
        tapItem(row: row, column: column)
        chooseBackground(row: row, column: column)
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
                                                        .fill(zGrounds[r][c])
                                                    Text("\(grid[r][c] == 0 ? inputGrid[r][c] == 0 ? "" : String(inputGrid[r][c]) : String(grid[r][c]))")
                                                        .font(.largeTitle)
                                                        .foregroundColor(textColor[r][c])
                                                }
                                                .onTapGesture {
                                                    column = c
                                                    row = r
                                                    tapItem(row: row, column: column)
                                                    chooseBackground(row: row, column: column)
                                                    chooseTextColor(row:row,column:column)
                                                    eraseInit(row: row, column: column)
                                                    
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
                    eraseGrid(row: row, column: column)
                    chooseBackground(row: row, column: column)
                    chooseTextColor(row:row,column:column)
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
                        if grid[row][column] == 0{
                        inputGrid[row][column]=num
                        tapItem(row: row, column: column)
                            chooseBackground(row: row, column: column)
                            chooseTextColor(row: row, column: column)
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
