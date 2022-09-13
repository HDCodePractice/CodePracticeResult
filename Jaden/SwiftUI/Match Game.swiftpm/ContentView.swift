import SwiftUI

struct ContentView: View {
    let height = 4
    let width = 4
    let symbols = ["globe.americas.fill","sun.min","sun.and.horizon","sun.haze","sparkles","moon.stars","cloud.drizzle","cloud.bolt.rain","wind","snowflake","bolt","hare","tortoise"]
    @State var image = "trash"
    @State var board : [[String]] = []
    
    func startGame(){
        let symbolAmount = height*width/2
        let prePutSymbols = Array(symbols.shuffled().prefix(symbolAmount))
        let putSymbols = (prePutSymbols + prePutSymbols).shuffled()
        
        var symbolIndex = 0
        board = []
        for _ in 0..<height{
            var rowArray : [String] = []
            for _ in 0..<width{
                rowArray.append(putSymbols[symbolIndex])
                symbolIndex += 1
            }
            board.append(rowArray)
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
                            Image(systemName: image)
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.white)
                                .padding()
                        }.onTapGesture {
                            image = board[row][column]
                        }
                    }
                }
            }
            Button("Restart Game"){
                startGame()
            }
        }
        .onAppear { 
            startGame()
        }
    }
}
