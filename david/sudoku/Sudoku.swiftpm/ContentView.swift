import SwiftUI

struct ContentView: View {
    
    @State var game = Game()
    @State var getNum = 0
    @State var showNum:Int = 0
    @State var choosed = false
    @State var color:Color = .white
    //    let r = game.row
    //    let c = game.column
    
    var body: some View {
        
        VStack {
            
            Text("Sudoku")
                .foregroundColor(.accentColor)
                .font(.largeTitle)
            ZStack{
                Color.secondary
                
                VStack(spacing:1){
                    ForEach(0..<game.row,id:\.self){i in
                        HStack(spacing:1){
                            ForEach(0..<game.column){j in
                                ZStack{
                                    Rectangle()
                                        .fill(color)
                                    
                                    Text(game.nineBoard[i][j]==0 ? "":"\(game.nineBoard[i][j])")
                                        .font(.largeTitle)
                                }
                                .onTapGesture {
                                    if game.nineBoard[i][j] == 0{
                                        game.nineBoard[i][j] = getNum
                                        getNum = 0
                                    }
                                    color = .white
                                }
                            }
                        }
                    }
                    
                    
                }
                .padding(.maximum(3, 3))
                
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
