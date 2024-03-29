import SwiftUI
struct ContentView: View {
    let num1 = ["1","2","3","4","5","6","7","8","9"]
    let num2 = ["9","8","7","6","5","4","3","2","1"]
    @State var vm = putChess()
    var borardGrid = BoardGrid()
    
    var body: some View {
        ZStack{
            
            VStack(spacing:0){
                ForEach(0..<10){row in
                    HStack(spacing:0){
                        ForEach(0..<9){column in
                            
                            let grid = borardGrid.grids[row][column]
                            ZStack{
                                Board(grid: grid)
                                
                                
                                Image(vm.board[row][column].token.name)
                                    .resizable()
                                    .scaledToFit()
                            }
                            .onTapGesture {
                                vm.tapGrid(grid: vm.board[row][column])
                            }
                        }
                    }
                }
            }
            chuhe()
        }
        .padding(10)
    }
}
