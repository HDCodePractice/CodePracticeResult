import SwiftUI
var playerTurn = 0
struct ContentView: View {
    

    
    @State var board : [[[String]]] = [[["","0","0"],["","0","1"],["","0","2"]]
    ,[["","1","0"],["","1","1"],["", "1","2"]]
    ,[["","2","0"],["","2","1"],["","2","2"]]]
    var body: some View {
        VStack(spacing:0){
            ForEach(board,id:\.self){
                row in HStack(spacing:0){
                    ForEach(row,id:\.self){
                        grid in 
                        ZStack{
                            
                            Rectangle()
                                .stroke(lineWidth: 10)
                            Rectangle()
                                .fill(.black)
                            if grid[0] == "o"{
                                Circle()
                                    .fill(.mint)
                                    .padding()
                            }
                            if grid[0]=="x"{
                                Circle()
                                    .stroke(lineWidth: 25)
                                    .fill(.orange)
                                    .padding(28)
                            }
                        }
                        .onTapGesture {
                            let x = Int(grid[1])!
                            let y = Int(grid[2])!
                            let z = board[x][y][0]
                            switch z{
                                case "o":
                                board[x][y]=["x","\(x)","\(y)"]
                            case "x":
                                board[x][y]=["","\(x)","\(y)"]
                            default:
                                board[x][y]=["o","\(x)","\(y)"]
                            }
                        }                   
                        
                    }
                }
            }
        }
    }
                                    }

                                    
