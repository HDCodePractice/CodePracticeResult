import SwiftUI
func genBoard() -> [[Int]]{
    let length = 6
    let height = 6
    var x = 0
    
    var y = 0
    var board : [[Int]] = []
    var color : [[Color]] = []
    for i in 0...height-1{
        board.append([])
        color.append([])
        for _ in 0...length-1{
            board[i].append(0)
            color[i].append(.clear)
        }
    }
    for a in 1...length*height/2{
        x = Int.random(in:0...length-1)
        y = Int.random(in:0...height-1)
        while true{
            if board[y][x] == 0{
                board[y][x] = a
                break
            }else{
                x = Int.random(in:0...length-1)
                y = Int.random(in:0...height-1)
            }
        }
        while true{
            if board[y][x] == 0{
                board[y][x] = a
                break
            }else{
                x = Int.random(in:0...length-1)
                y = Int.random(in:0...height-1)
            }
        }
    }
    return board
}
func makeColor()->[[Color]]{
    let length = 6
    let height = 6
    var color : [[Color]] = []
    for i in 0...height-1{
        color.append([])
        for _ in 0...length-1{
            color[i].append(.clear)
        }
    }
    return color
}
import SwiftUI
struct ContentView: View {
    @State var colorr : [[Color]] = makeColor()
    @State var board : [[Int]] = genBoard()
    @State var lol = true
    @State var xx = 0
    @State var yy = 0
    @State var aa = 0
    @State var clerr = false
    var body: some View {
        VStack{
            ZStack{
                Color.black
                VStack(spacing:3) {
                    ForEach(0..<board.count,id:\.self){ row in
                        HStack(spacing:3) {
                            ForEach(0..<board[row].count,id:\.self){column in
                                ZStack{
                                    Rectangle()
                                    if board[row][column] < 51{
                                        Image(systemName: "\(board[row][column])\(".circle.fill")")
                                            .resizable()
                                            .scaledToFit()
                                            .foregroundColor(colorr[row][column])
                                            .padding(5)
                                    }else if board[row][column]<101{
                                        Image(systemName: "\(board[row][column]-50)\(".square.fill")")
                                            .resizable()
                                            .scaledToFit()
                                            .foregroundColor(colorr[row][column])
                                            .padding(5)
                                    }else if board[row][column]<150{
                                        Image(systemName: "\(board[row][column]-100)\(".circle")")
                                            .resizable()
                                            .scaledToFit()
                                            .foregroundColor(colorr[row][column])
                                            .padding(5)
                                    }else{
                                        Image(systemName: "\(board[row][column]-150)\(".square")")
                                            .resizable()
                                            .scaledToFit()
                                            .foregroundColor(colorr[row][column])
                                            .padding(5)
                                    }
                                }
                                .onTapGesture {
                                    withAnimation(.linear(duration: 1)){
                                        if colorr[row][column] == .clear{
                                            if lol{
                                                xx = row
                                                yy = column
                                                aa = board[row][column]
                                                colorr[row][column] = .blue
                                            }else{
                                                colorr[row][column] = .blue
                                                if aa == board[row][column]{
                                                    colorr[xx][yy] = .accentColor
                                                    colorr[row][column] = .accentColor
                                                }else{
                                                    clerr = true
                                                }
                                            }
                                            lol.toggle()
                                        }
                                    }
                                    withAnimation(.linear(duration: 1.5)){
                                        if clerr{
                                            colorr[xx][yy] = .blue;colorr[row][column] = .blue
                                        }
                                    }
                                    withAnimation(.linear(duration: 1.5)){
                                        if clerr{
                                            colorr[xx][yy] = .clear;colorr[row][column] = .clear
                                            clerr = false
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            Button("Restart Board"){
                board = genBoard()
                colorr = makeColor()
                clerr = false
                lol = true
            }.buttonStyle(.bordered)
        }
        .padding()
    }
}
