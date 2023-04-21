import SwiftUI

struct MatchView: View {
            @State private var showingDog = false
    let height = 4
    let width = 5
    let symbols = ["1","2","3","4","Aussie","aussiepuppy","JPEG image 1","JPEG image 2","JPEG image 3","JPEG image 4","JPEG image 5"]
    @State var board : [[String]] = []
    @State var boardOpacity : [[Double]] = []
    @State var lastTap : [Int] = []
    
    func startGame(){
        let symbolAmount = height*width/2
        let prePutSymbols = Array(symbols.shuffled().prefix(symbolAmount))
        let putSymbols = (prePutSymbols + prePutSymbols).shuffled()
        var symbolsIndex = 0
        board = []
        boardOpacity = []
        for _ in 0..<height{
            var rowArray : [String] = []
            var boardOpacityRow : [Double] = []
            for _ in 0..<width{
                rowArray.append(putSymbols[symbolsIndex])
                boardOpacityRow.append(0)
                symbolsIndex += 1
            }
            board.append(rowArray)
            boardOpacity.append(boardOpacityRow)
        }
    }
    
    var body: some View {
        if showingDog == false{
            VStack{
                Text("Match Game")
                    .font(.largeTitle)
                ForEach(0..<board.count,id:\.self){ row in
                    HStack{
                        ForEach(0..<board[row].count,id:\.self){ column in
                            ZStack{
                                Rectangle()
                                    .fill(.red)
                                
                                Image(board[row][column])
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(.yellow)
                                    .opacity(boardOpacity[row][column])
                                    .padding()
                            }
                            .onTapGesture {
                                if lastTap.isEmpty{
                                    lastTap = [row,column]
                                    withAnimation(.easeIn(duration: 0.2)){
                                        boardOpacity[row][column] = 1
                                    }
                                }else{
                                    let lastTapRow = lastTap[0]
                                    let lastTapColumn = lastTap[1]
                                    if board[lastTapRow][lastTapColumn] == board[row][column]{
                                        withAnimation(.easeIn(duration: 0.2)){
                                            boardOpacity[row][column] = 1
                                        }
                                    }else{
                                        withAnimation(.easeIn(duration: 0.2)){
                                            boardOpacity[row][column] = 1
                                        }
                                        withAnimation(.easeIn(duration: 0.2).delay(0.2)){
                                            boardOpacity[row][column] = 0
                                            boardOpacity[lastTapRow][lastTapColumn] = 0
                                        }
                                    }
                                    lastTap = []
                                }
                            }
                        }
                    }
                }
                Button("Restart Game"){
                    withAnimation{
                        startGame()
                    }
                }
                Button() {
                    showingDog = true
                } label: {
                    ZStack {
                        Color(red: 0, green: 0.8, blue: 0.6)
                        Text("Home")
                            .font(.system(size: 40, design: .rounded))
                            .bold()
                            .foregroundColor(.black)
                            .font(.title)
                    }
                    .cornerRadius(20)
                    .padding()
                    
                }
            }
            .onAppear { 
                startGame()
            }
        }
        if showingDog == true{
            HomeView()
        }

    }
}
