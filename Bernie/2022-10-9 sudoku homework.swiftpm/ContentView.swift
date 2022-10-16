import SwiftUI

struct ContentView: View {
    @State var grid : [[Int]] = Array(repeating: Array(repeating: 0, count: 9), count: 9)
    @State var backgrounds : [[Color]] = Array(repeating: Array(repeating: .white, count: 9), count: 9)
    @State var currentNumber : Int = 0
    @State var currentLocatioin : [Int] = []
    @State var textColor : [[Color]] = Array(repeating: Array(repeating: .black, count: 9), count: 9)
    
    func gridInit(){
        grid = Array(repeating: Array(repeating: 0, count: 9), count: 9)
        var numbers : [Int] = [1,2,3,4,5,6,7,8,9]
        
        for row1 in 0...2{
            for column1 in 0...2{
                if row1 == column1{
                    numbers.shuffle()
                    var numArray : [Int] = numbers
                    for row2 in 0...2{
                        for column2 in 0...2{
                            grid[row1*3 + row2][column1*3 + column2] = numArray.first!
                            numArray.removeFirst()
                        }
                    }
                }
            }
        } 
    }
    
    func backgroundsInit(){
        backgrounds = Array(repeating: Array(repeating: .white, count: 9), count: 9)
    }
    
    func textColorInit(){
        textColor = Array(repeating: Array(repeating: .black, count: 9), count: 9)
    }
    
    func tapItem(row:Int, column:Int){
        backgroundsInit()
        print("\(row) \(column)")
        for i in 0...8{
                backgrounds[row][i] = .gray
                backgrounds[i][column] = .gray
        }
        for i in 0...2{
            for j in 0...2{
                backgrounds[row/3*3+i][column/3*3+j] = .gray
            }
        }
        backgrounds[row][column] = Color.indigo
        if grid[row][column] == 0 {
            textColor [row][column] = Color.mint
        }
        
        print(backgrounds)
        print("\(grid)")
    }
    
    func showSameNumRowCol(row:Int, column:Int){
        print("\(row) \(column)")
        for i in 0...8{
            //            print( grid[row][i])
            //            print("***")
            if grid[row][i] == currentNumber && grid[row][i] != 0 && i != column{
                backgrounds[row][i] = .red
//                print("\(backgrounds[row][i])")
//                print("\(row) \(i)")
//                print("\(grid[row][i])")
                backgrounds[row][column] = Color.red
                textColor[row][column] = Color.secondary
            }
            //            print(grid[i][column])
            //            print("***")
            if grid[i][column] == currentNumber && grid[i][column] != 0 && i != row{
                backgrounds[i][column] = .red
//                print("\(backgrounds[i][column])")
//                print("\(i) \(column)")
//                print("\(grid[i][column])")
                backgrounds[row][column] = Color.red
                textColor[row][column] = Color.secondary
            }
            for j in 0...8{
                if grid[i][j] == grid[row][column] && i != row && j != column && grid[i][j] != 0 {
                    backgrounds[i][j] = .secondary
                }
            }
        }
        
    }
    
    func startGame(){
        gridInit()
        backgroundsInit()
        currentLocatioin = [4,2]
        tapItem(row: currentLocatioin[0], column: currentLocatioin[1])
    }
    
    var body: some View {
        ZStack{
            Color.black
            VStack(spacing: 3) {
                ForEach(0..<3,id:\.self){row1 in
                    HStack(spacing: 3){
                        ForEach(0..<3,id:\.self){column1 in
                            VStack(spacing: 1) {
                                ForEach(0..<3,id:\.self){row2 in
                                    HStack(spacing: 1){
                                        ForEach(0..<3,id:\.self){column2 in
                                            let r : Int = row1*3 + row2
                                            let c : Int = column1*3 + column2
                                            ZStack{
                                                Rectangle()
                                                    .fill(backgrounds[r][c])
                                                //                                                Text("\(row1)\(column1)\n\(row2)\(column2)")
                                                //                                                    .foregroundColor(.primary)
                                                Text("\(grid[r][c] == 0 ? "" : "\(grid[r][c])")")
                                                    .font(.largeTitle)
                                                    .foregroundColor(textColor[r][c])
                                                
                                            }
                                            .onTapGesture {
                                                currentLocatioin = [r, c]
                                                tapItem(row: currentLocatioin[0], column: currentLocatioin[1])
                                                showSameNumRowCol(row: r, column: c)
                                                currentNumber = 0
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
        
        VStack{
            Button {
                grid[currentLocatioin[0]][currentLocatioin[1]] = 0
                
            } label: {
                Label("Erase", systemImage: "pencil.slash")}
            .buttonStyle(.borderedProminent)
            .font(.largeTitle)
            HStack{
                ForEach(1...9, id:\.self){num in
                    Button("\(num)"){
                        //                            if currentLocatioin.isEmpty == false {
                        grid[currentLocatioin[0]][currentLocatioin[1]] = num
                        //                            }
                        currentNumber = num
                        tapItem(row: currentLocatioin[0], column: currentLocatioin[1])
                        showSameNumRowCol(row: currentLocatioin[0], column: currentLocatioin[1])
                    }
                    .buttonStyle(.borderedProminent)
                    .font(.headline)
                }
            }
            Button("Reset") { 
                startGame()
            }
            .buttonStyle(.borderedProminent)
            .font(.largeTitle)
        }
        .padding()
    }
}
