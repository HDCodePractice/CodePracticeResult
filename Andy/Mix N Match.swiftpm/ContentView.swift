import SwiftUI
func genBoard() -> [[Int]]{
    let length = 5
    let height = 4
    var symbol : [Int] = []
    for i in 1...length*height/2{
        symbol.append(i)
        symbol.append(i)
    }
    var board : [[Int]] = []
    symbol = symbol.shuffled()
    for a in 0..<height{
        var rowArray : [Int] = []
        for b in 0..<length{
            rowArray.append(symbol[a*length+b])
        }
        board.append(rowArray)
    }
    return board
}
func makeColor()->[[Color]]{
    let length = 20
    let height = 20
    var color : [[Color]] = []
    for i in 0...height-1{
        color.append([])
        for _ in 0...length-1{
            color[i].append(.clear)
        }
    }
    return color
}
func makeOpacity()->[[Double]]{
    let length = 20
    let height = 20
    var color : [[Double]] = []
    for i in 0...height-1{
        color.append([])
        for _ in 0...length-1{
            color[i].append(1)
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
    @State var one = 0
    @State var two = 0
    @State var turn = false
    @State var aa = 0
    @State var clerr = false
    @State var opacity : [[Double]] = makeOpacity()
    var body: some View {
        VStack{
            Text("Match Game")
                .font(.title)
                
            ZStack{
                Color.black
                VStack(spacing:3) {
                    ForEach(0..<board.count,id:\.self){ row in
                        HStack(spacing:3) {
                            ForEach(0..<board[row].count,id:\.self){column in
                                ZStack{
                                    Rectangle()
                                        .foregroundColor(.red)
                                        .opacity(opacity[row][column])
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
                                                colorr[row][column] = .yellow
                                                opacity[row][column] = 0.66
                                            }else{
                                                colorr[row][column] = .yellow
                                                opacity[row][column] = 0.66
                                                
                                                if aa == board[row][column]{
                                                    colorr[xx][yy] = .cyan
                                                    opacity[row][column] = 0.33
                                                    colorr[row][column] = .cyan
                                                    opacity[xx][yy] = 0.33
                                                    if turn{
                                                        one+=1
                                                        turn.toggle()
                                                    }else{
                                                        two+=1
                                                        turn.toggle()
                                                    }
                                                }else{
                                                    clerr = true
                                                }
                                                turn.toggle()
                                            }
                                            lol.toggle()
                                        }
                                    }
                                    
                                    withAnimation(.linear(duration: 1.5)){
                                        if clerr{
                                            colorr[xx][yy] = .yellow;colorr[row][column] = .yellow
                                            opacity[row][column] = 0.66;opacity[xx][yy] = 0.66
                                        }
                                    }
                                    withAnimation(.linear(duration: 1.5).delay(1.5)){
                                        
                                        if clerr{
                                            colorr[xx][yy] = .clear;colorr[row][column] = .clear
                                            opacity[row][column] = 1;opacity[xx][yy] = 1
                                            clerr = false
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            Text("\("Player One: ")\(one)\(", player two: ")\(two)")
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
