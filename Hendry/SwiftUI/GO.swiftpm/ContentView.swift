import SwiftUI

struct ContentView: View {
    @State var chess = 0
    @State var board = 10
    var body: some View {
        VStack {
            ForEach(board){ siz in
                Image("chess board").onTapGesture {
                    chess+=1
                    if chess % 2 != 0{
                        Image("white")
                    }else if chess % 2 == 0{
                        Image("black")
                    }
                }
            }
        }
    }
}

