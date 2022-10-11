import SwiftUI
func startGame()->[[Int]]{
    var bod : [[Int]] = []
    var num = [1,2,3,4,5,6,7,8,9]
    for i in 0...8{
        bod.append([])
        for _ in 0...8{
            bod[i].append(0)
        }
    }
    num=num.shuffled()
    for i in 0...2{
        for j in 0...2{
            bod[i][j]=(num[i*3+j])
        }
    }
    num=num.shuffled()
    for i in 0...2{
        for j in 0...2{
            bod[i+3][j+3]=(num[i*3+j])
        }
    }
    num=num.shuffled()
    for i in 0...2{
        for j in 0...2{
            bod[i+6][j+6]=(num[i*3+j])
        }
    }
    return bod
}
struct ContentView: View {
    @State var board = startGame()
    @State var origin : [[Int]] = []
    @State var x = 0
    @State var y = 0
    @State var first = true
    @State var color : [[Color]] = Array(repeating: Array(repeating: .primary, count: 9), count: 9)
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
                                                .foregroundColor(.black)
                                        }
                                        .onTapGesture {
                                            if first{
                                                first.toggle()
                                                origin = board
                                            }
                                            withAnimation{
                                                color = Array(repeating: Array(repeating: .primary, count: 9), count: 9)
                                                for i in 0...2{
                                                    for j in 0...2{
                                                        color[row1*3+i][column1*3+j] = .secondary
                                                    }
                                                }
                                                for i in 0...8{
                                                    color[row][i] = .secondary
                                                }
                                                for i in 0...8{
                                                    color[i][column] = .secondary
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
                ForEach(1...9,id:\.self){ i in
                    Button("\(i)"){
                        if origin[x][y] == 0{
                            board[x][y] = i
                        }
                    }.buttonStyle(.bordered)
                }
            }
            Button("restart"){
                board = startGame()
                origin = board
            }
        }
        .padding(10)
    }
}
