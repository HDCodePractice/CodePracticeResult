import SwiftUI

struct ContentView: View {
    let height = 4
    let width = 6
    let symbols = ["globe.americas.fill","sun.min","person.circle","sun.haze","sparkles","moon.stars","cloud.drizzle","cloud.bolt.rain","wind","snowflake","bolt","hare","tortoise"]
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
        VStack{
            Text("Match Game")
                .font(.largeTitle)
            ForEach(0..<board.count,id:\.self){ row in
                HStack{
                    ForEach(0..<board[row].count,id:\.self){ column in
                        ZStack{
                            Rectangle()
                                .fill(.red)
                                
                            Image(systemName: board[row][column])
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
        }
        .onAppear { 
            startGame()
        }
    }
}
