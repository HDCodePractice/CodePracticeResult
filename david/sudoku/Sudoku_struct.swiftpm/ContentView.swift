import SwiftUI

struct ContentView: View {
    
    @State var game = Game()
    @State var getNum = 0
    @State var showNum:Int = 0
    @State var choosed = false
    @State var color:Color = .white
    @State var numArr:[Int] = []
    
    var body: some View {
        
        VStack {
            
            Text("Sudoku")
                .foregroundColor(.accentColor)
                .font(.largeTitle)
            ZStack{
                Color.secondary
                
                VStack(spacing:-3
                ){
                    ForEach(0..<3,id:\.self){r in
                        HStack(spacing:-3){
                            ForEach(0..<3,id:\.self){c in
                                VStack(spacing:1){
                                    ForEach(0..<3,id:\.self){i in
                                        HStack(spacing:1){
                                            ForEach(0..<3){j in
                                                
                                                var grid = game.bigBoard[r][c].nineBoard[i][j]
                                                ZStack{
                                                    Rectangle()
                                                        .fill(grid.status.color)
                                                    
                                                    Text(grid.num==0 ? "":"\(grid.num)")
                                                        .font(.largeTitle)
                                                }
                                                .onTapGesture {
                                                    if grid.num == 0 {
                                                        grid.num = getNum
                                                        game.afterTap(grid: grid,nineBoard: game.bigBoard[r][c])
                                                        numArr.append(getNum)
                                                        getNum = 0
                                                    }
                                                    
                                                }
                                            }
                                        }
                                    }
                                }
                                .padding(.maximum(3, 3))
                            }
                        }
                    }
                }
            }
        }
        
        HStack{
            ForEach(1...9,id:\.self){i in
                
                Button("\(i)"){
                    
                        getNum = i
                        
                        choosed = true
                    
                }
                .buttonStyle(.borderless)
            }
        }
        .padding()
    }
}
