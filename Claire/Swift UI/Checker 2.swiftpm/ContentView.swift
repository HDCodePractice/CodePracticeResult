import SwiftUI

struct ContentView: View {
    @State var boardColor : [[Color]] = [
        [.white, .black, .white, .black, .white, .black, .white, .black],
        [.black, .white, .black, .white, .black, .white, .black, .white],
        [.white, .black, .white, .black, .white, .black, .white, .black],
        [.black, .white, .black, .white, .black, .white, .black, .white],
        [.white, .black, .white, .black, .white, .black, .white, .black],
        [.black, .white, .black, .white, .black, .white, .black, .white],
        [.white, .black, .white, .black, .white, .black, .white, .black],
        [.black, .white, .black, .white, .black, .white, .black, .white],
    ]
    
    @State var piecePosition : [[String]] = [
        ["", "white", "", "white", "", "white", "", "white"],
        ["white", "", "white", "", "white", "", "white", ""],
        ["", "", "", "white", "", "", "", "white"],
        ["", "", "white", "", "white", "", "", ""],
        ["", "", "", "black", "", "", "", ""],
        ["black", "", "black", "", "black", "", "black", ""],
        ["", "black", "", "black", "", "", "", "black"],
        ["black", "", "black", "", "black", "", "black", ""],
    
    ]
    var body: some View {
        VStack {
            ForEach(0..<8, id:\.self){ a in
                HStack{
                    ForEach(0..<8, id:\.self){ b in
                        ZStack{
                            Rectangle()
                                .fill(boardColor[a][b])
                            if piecePosition[a][b] == "white"{
                                Circle()
                                    .fill(.white)
                            } else if piecePosition[a][b] == "black"{
                                Circle()
                                    .fill(.black)
                            }
                        }
                    }
                }
            }
        }
    }
}
