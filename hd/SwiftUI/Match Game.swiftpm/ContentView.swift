import SwiftUI

struct ContentView: View {
    @State var game = Game()
    var body: some View {
        VStack{
            Text("Match Game")
                .foregroundColor(.accentColor)
                .font(.largeTitle)
            ZStack{
                Color.secondary
                VStack{
                    ForEach(0..<game.board.count,id:\.self){ row in
                        HStack{
                            ForEach(0..<game.board[row].count,id:\.self){ column in
                                let grid = game.board[row][column]
                                ZStack{
                                    Rectangle()
                                        .foregroundColor(grid.status.color)
                                    Image(systemName: grid.symbol)
                                        .resizable()
                                        .scaledToFit()
                                        .opacity( grid.status == .covered ? 0 : 1 )
                                        .padding()
                                }
                                .onTapGesture {
                                    var needAfter = false
                                    withAnimation(.easeIn(duration: 0.2)){
                                        needAfter = game.tapGrid(grid: grid)
                                    }
                                    if needAfter{
                                        withAnimation(.easeIn(duration: 0.2).delay(0.2)){
                                            game.afterTapGrid(grid: grid)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            Button("Restart Game"){
                game.startGame()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
