import SwiftUI

struct ContentView: View {
    @State var board : [[Int]] = 
    [[0,1,0,1,0,1,0,1],
     [1,0,1,0,1,0,1,0],
     [0,1,0,1,0,1,0,1],
     [1,0,1,0,1,0,1,0],
     [0,1,0,1,0,1,0,1],
     [1,0,1,0,1,0,1,0],
     [0,1,0,1,0,1,0,1],
     [1,0,1,0,1,0,1,0]]
    var body: some View {
        VStack(spacing:0){
            ForEach(0..<board.count){row in
                HStack(spacing:0){
                    ForEach(0..<board.count){column in
                        ZStack{
                            if board[row][column] == 0{
                                Rectangle()
                                    .fill(.white)
                            }
                            if row <= 2 && board[row][column] == 0{
                                Circle()
                                    .fill(.cyan)
                                
                            }
                        }
                        ZStack{
                            if board[row][column] == 1{
                                Rectangle()
                                    .fill(.black)
                            }
                            if row >= 5 && board[row][column] == 1{
                                Circle()
                                    .fill(.white)
                                
                            }
                        }
                    }
                }
            }
        }
    }
}
