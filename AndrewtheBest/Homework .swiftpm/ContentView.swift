import SwiftUI

struct ContentView: View {
    @State var board : [[[String]]] = [[["X", "0", "0"],[" ", "0", "1"],[" ", "0", "2"]],
                                       [[" ", "1", "0"],[" ", "1", "1"],[" ", "1", "2"]],
                                       [[" ", "2", "0"],[" ", "2", "1"],["O", "2", "2"]]]
    var body: some View {
        VStack(spacing: 0){
            ForEach(board,id:\.self){row in
                HStack(spacing: 0){
                    ForEach(row,id:\.self){item in
                        ZStack{
                            //Rectangle().stroke(.cyan, lineWidth: 10)
                            Rectangle().fill(.white)
                            Rectangle().stroke(lineWidth: 10).fill(.orange)
                            //Text(item).font(.system(size: 100))
                            if item[0] == "O"{
                                Circle().fill(.blue).padding()
                            }else if item[0] == "X"{
                                Circle().stroke(lineWidth: 25).fill(.red).padding(30)
                            }
                        }.onTapGesture {
                            let x = Int(item[1])!
                            let y = Int(item[2])!
                            
                            if board[x][y][0] == "O"{
                                board[x][y] = ["X", "\(x)", "\(y)"]
                            }else if board[x][y][0] == "X"{
                                board[x][y] = [" ", "\(x)", "\(y)"]
                            }else if board[x][y][0] == " "{
                                board[x][y] = ["O", "\(x)", "\(y)"]
                            }
                            
                        }
                    }
                }
            }
        }
    }
}
