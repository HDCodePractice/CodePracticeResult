import SwiftUI
func genColor()->[[Color]]{
    var lol : [[Color]] = []
    for i in 0...9{
        lol.append([])
        for _ in 1...10{
            lol[i].append(.primary)
        }
    }
    return lol
}
struct ContentView: View {
    @State var board = [
        [1,2,3,4,5,6,7,8,9],
        [1,2,3,4,5,6,7,8,9],
        [1,2,3,4,5,6,7,8,9],
        [1,2,3,4,5,6,7,8,9],
        [1,2,3,4,5,6,7,8,9],
        [1,2,3,4,5,6,7,8,9],
        [1,2,3,4,5,6,7,8,9],
        [1,2,3,4,5,6,7,8,9],
        [1,2,3,4,5,6,7,8,9]
    ]
    @State var color : [[Color]] = genColor()
    var body: some View {
        VStack(spacing: 4){
            ForEach(0...2,id:\.self){ row in
                HStack(spacing:4) {
                    ForEach(0...2,id:\.self){column in
                        VStack(spacing: 2){
                            ForEach(0...2,id:\.self){ a in
                                HStack(spacing:2) {
                                    ForEach(0...2,id:\.self){b in
                                        ZStack{
                                            Rectangle()
                                                .fill(color[(row)*3+a][(column)*3+b])
                                            Text("\(board[(row)*3+a][(column)*3+b])")
                                                .foregroundColor(.black)
                                        }
                                        .onTapGesture {
                                            withAnimation{
                                                color = genColor()
                                                for i in 0...2{
                                                    for j in 0...2{
                                                        color[row*3+i][column*3+j] = .secondary
                                                    }
                                                }
                                                for i in 0...8{
                                                    color[(row)*3+a][i] = .secondary
                                                }
                                                for i in 0...8{
                                                    color[i][column*3+b] = .secondary
                                                }
                                                color[(row)*3+a][(column)*3+b] = .cyan
                                            }
                                        }
                                    }
                                    
                                }
                            }
                        }
                    }
                }
            }
            
        }
        .padding(10)
    }
}
