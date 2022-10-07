import SwiftUI
struct ContentView: View {
    @State var board = [
        [1,2,3,4,5,6,7,8,9],
        [2,2,3,4,5,6,7,8,9],
        [3,2,3,4,5,6,7,8,9],
        [4,2,3,4,5,6,7,8,9],
        [5,2,3,4,5,6,7,8,9],
        [6,2,3,4,5,6,7,8,9],
        [7,2,3,4,5,6,7,8,9],
        [8,2,3,4,5,6,7,8,9],
        [9,2,3,4,5,6,7,8,9],
    ]
    @State var color = Color.black
    
    var body: some View {
        VStack(spacing: 6){
            ForEach(0..<3,id:\.self){row1 in
                HStack(spacing: 6){
                    ForEach(0..<3,id:\.self){column1 in
                        VStack(spacing: 2){
                            ForEach(0..<3,id:\.self){row2 in
                                HStack(spacing: 2){
                                    ForEach(0..<3,id:\.self){column2 in
                                        ZStack{
                                            Rectangle()
                                                .fill(color)
                                            Text("\(board[row1*3 + row2][column1*3 + column2])")
                                                .foregroundColor(.accentColor)
                                        }
                                        .onTapGesture {
                                            color = Color.blue
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        .padding()
    }
}

