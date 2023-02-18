import SwiftUI

struct ContentView: View {
    @State var length = 8
    @State var height = 8
    @State var board = [
        ["Rook", "Bishop", "Knight", "Queen", "King", "Knight", "Bishop", "Rook"],
        ["Pawn", "Pawn", "Pawn", "Pawn", "Pawn", "Pawn", "Pawn", "Pawn"],
        ["", "", "", "", "", "", "", ""],
        ["", "", "", "", "", "", "", ""],
        ["", "", "", "", "", "", "", ""],
        ["", "", "", "", "", "", "", ""],
       ["Pawn", "Pawn", "Pawn", "Pawn", "Pawn", "Pawn", "Pawn", "Pawn"],
        ["Rook", "Bishop", "Knight", "Queen", "King", "Knight", "Bishop", "Rook"]
    ]
    var body: some View {
        HStack{
            VStack{
                ForEach(1..<9,id:\.self){ i in
                    ZStack{
                        Rectangle()
                            .fill(.clear)
                            .frame(width: 10)
                        Text("\(i)")
                    }
                }
            }
            VStack(spacing:0) {
                HStack{
                    ForEach(1..<9,id:\.self){ i in
                        ZStack{
                            Rectangle()
                                .fill(.clear)
                                .frame(height: 5)
                            Text(["A","B","C","D","E","F","J","H"][i-1])
                        }
                    }
                }
                ForEach(0..<height,id:\.self){ a in
                    HStack(spacing:0) {
                        ForEach(0..<length,id:\.self){ b in
                            ZStack{
                                Rectangle()
                                    .fill((a+b)%2==1 ? .black : .white)
                                ZStack{
                                    Circle()
                                        .stroke(lineWidth: 10)
                                        .fill(a > 5 ? .black : a < 2 ? .white : .clear)
                                    Circle()
                                        .fill(a > 5 ? .white : a < 2 ? .black : .clear)
                                    Text(board[a][b])
                                        .foregroundColor(.accentColor)
                                }
                                .padding(2)
                            }
                            
                        }
                    }
                }
                HStack{
                    ForEach(1..<9,id:\.self){ i in
                        ZStack{
                            Rectangle()
                                .fill(.clear)
                                .frame(height: 5)
                            Text(["A","B","C","D","E","F","J","H"][i-1])
                        }
                    }
                }
            }
            VStack{
                ForEach(1..<9,id:\.self){ i in
                    ZStack{
                        Rectangle()
                            .fill(.clear)
                            .frame(width: 10)
                        Text("\(i)")
                    }
                }
            }
        }
        .padding(20)
    }
}
