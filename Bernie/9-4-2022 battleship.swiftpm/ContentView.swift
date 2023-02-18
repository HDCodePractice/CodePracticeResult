import SwiftUI

struct ContentView: View {
    @State var game = Game()
    
    var body: some View {
        VStack {
            Text("Battleship")
                .foregroundColor(.accentColor)
                .font(.largeTitle)
            ZStack{
                Color.secondary
                VStack{
                    ForEach(0..<game.board.count ,id:\.self){row in
                        HStack{
                            ForEach(0..<game.board[row].count ,id:\.self){column in
                                let grid = game.board[row][column]
                                ZStack{
                                    Rectangle()
                                        .fill(grid.gridColor)//.fill(grid.status == .showingboat ? grid.gridColor : .mint)
                                    
                                    Image(systemName: grid.status == .unclicked ? Symbol.square.name : grid.symbol.name)
                                        .opacity(grid.status == .unclicked ? 0.2 : 1)
                                    
                                }
                                .onTapGesture{
                                    game.tapGrid(grid:grid)
                                }
                            }
                        }
                    }
                }
            }
            HStack{
                Button("Restart"){  game.startGame()
                    print(game.allBoatsCoordinates)
                }
                    .buttonStyle(.borderedProminent)
                Button("Test"){
                    game.genBoat(boatLength:2)
                    print(game.boatCoordinates)
                    let result = game.isOverlapping(allBoatsCoordinates: game.allBoatsCoordinates, boat: game.boatCoordinates)
                    print(result)
                    if !result {
                        game.allBoatsCoordinates.append(game.boatCoordinates)
                    } 
                    print(game.allBoatsCoordinates)
                    
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
            
        }
    }
}
