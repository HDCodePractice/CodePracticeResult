import SwiftUI

struct ContentView: View {
    @State var grid : [[Int]] = Array(
        repeating: Array(repeating: 0, count: 9), 
        count: 9)
    
    @State var backgrounds : [[Color]] = Array(
        repeating: Array(repeating: .white, count: 9), 
        count: 9)
    
    @State var row : Int = 0
    @State var column : Int = 0
    
    func gridInit(){
        grid = Array(
            repeating: Array(repeating: 0, count: 9), 
            count: 9)
    }
    
    func backgroundsInit(){
        backgrounds = Array(
            repeating: Array(repeating: .white, count: 9), 
            count: 9)
    }
    
    func tapItem(row:Int,column:Int){
        backgroundsInit()
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
                                                    Text("\(grid[r][c]==0 ? "" : String(grid[r][c]))")
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
                        grid[row][column]=num
                    }
                    .font(.largeTitle)
                    .buttonStyle(.bordered)
                }
            }
        }
        .padding()
        
    }
}
