import SwiftUI

struct ContentView: View {
    @State var board = [["","","",""],["","","",""],["","","",""],["","","",""]]
    var body: some View {
        VStack {
            ZStack{
                Color.black
                VStack(spacing:2){
                    ForEach(0..<board.count,id:\.self){row in
                        ForEach(0..<board[row].count,id:\.self){column in
                            ZStack{
                                Rectangle()
                                    .fill(.white)
                                Image(systemName:board[row][column])
                                    .resizable()
                                    .
                            }
                        }
                    }
                }
            }
        }
    }
    func gameStart(){
        var possiblePicture : [String] = ["airplane","bus.fill","tram","bicycle","airplane","camera.macro","hourglass","bolt","flame","leaf.arrow.triangle.circlepath"]
        possiblePicture.shuffle()
        for i in 1...board.count{
            for j in 1 ... board.count{
                
            }
        }
    }
}
