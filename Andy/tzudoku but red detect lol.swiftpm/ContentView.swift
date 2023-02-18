import SwiftUI
struct ContentView: View {
    func startGame()->[[Int]]{
        var bod : [[Int]] = []
        var num = [1,2,3,4,5,6,7,8,9]
        for i in 0...8{
            bod.append([])
            for _ in 0...8{
                bod[i].append(0)
            }
        }
        let grid = [0,3,6]
        for g in grid{
            num=num.shuffled()
            for i in 0...2{
                for j in 0...2{
                    bod[i+g][j+g]=(num[i*3+j])
                }
            }
        }
        return bod
    }
    @State var board : [[Int]] = Array(repeating: Array(repeating: 0, count: 9), count: 9)
    @State var origin : [[Int]] = Array(repeating: Array(repeating: 1, count: 9), count: 9)
    @State var x = 0
    @State var y = 0
    @State var first = true
    @State var color : [[Color]] = Array(repeating: Array(repeating: .primary, count: 9), count: 9)
    @State var conflict = Array(repeating: Array(repeating: 0, count: 9), count: 9)
    var body: some View {
        VStack(spacing: 4){
            ForEach(0...2,id:\.self){ row1 in
                HStack(spacing:4) {
                    ForEach(0...2,id:\.self){column1 in
                        VStack(spacing: 2){
                            ForEach(0...2,id:\.self){ a in
                                HStack(spacing:2) {
                                    ForEach(0...2,id:\.self){b in
                                        let row : Int = row1*3+a
                                        let column : Int = column1*3+b
                                        ZStack{
                                            Rectangle()
                                                .fill(color[row][column])
                                            Text("\(board[row][column])")
                                                .foregroundColor(board[row][column]==0 ? .clear : (origin[row][column]==0 ? (conflict[row][column] == 0 ? .blue : .red) : .black ) )
                                        }
                                        .onTapGesture {
                                            if first{
                                                first.toggle()
                                                origin = board
                                            }
                                            withAnimation{
                                                for i in 0...8{
                                                    for j in 0...8{
                                                        if color[i][j] != .orange{
                                                            color[i][j] = .primary
                                                        }
                                                    }
                                                }
                                                for i in 0...2{
                                                    for j in 0...2{
                                                        if color[row][i] != .orange{
                                                            color[row1*3+i][column1*3+j] = .secondary
                                                        }
                                                    }
                                                }
                                                for i in 0...8{
                                                    if color[row][i] != .orange{
                                                        color[row][i] = .secondary
                                                    }
                                                    if color[i][column] != .orange{
                                                        color[i][column] = .secondary
                                                    }
                                                }
                                                color[row][column] = .cyan
                                                x=row
                                                y=column
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                } 
            }
            HStack{
                ForEach(1...9,id:\.self){ l in
                    Button("\(l)"){
                        if origin != []{
                            if origin[x][y] == 0{
                                board[x][y] = l
                                for i in 0...8{
                                    if board[x][i]==board[x][y] && i != y {
                                        conflict[x][y] = l
                                        conflict[x][i] = l
                                        color[x][i] = .orange
                                        color[x][y] = .orange
                                    }
                                    if board[i][y]==board[x][y] && i != x {
                                        conflict[x][y] = l
                                        conflict[i][y] = l
                                        color[i][y] = .orange
                                        color[x][y] = .orange
                                    }
                                }
                            }
                        }
                    }.buttonStyle(.bordered)
                }
            }
            Button("Erase"){
                if origin != []{
                    if origin[x][y] == 0{
                        board[x][y] = 0
                        conflict[x][y] = 0
                    }
                    if conflict[x][y]>0{
                        
                    }
                }
            }.buttonStyle(.bordered)
            Button("restart"){
                board = startGame()
                origin = board
            }.buttonStyle(.bordered)
        }
        .onAppear{
            board = startGame()
            origin = board
            conflict = Array(repeating: Array(repeating: 0, count: 9), count: 9)
        }
        .padding(10)
    }
}
