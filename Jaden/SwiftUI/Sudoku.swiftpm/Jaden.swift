import SwiftUI
struct JadenView: View {
    @State var board = [[0,0,0],[0,0,0],[0,0,0]]
    @State var align = [Alignment.topLeading, Alignment.top, Alignment.topTrailing, Alignment.leading, Alignment.center, Alignment.trailing, Alignment.bottomLeading, Alignment.bottom, Alignment.bottomTrailing ]
    var body: some View {
        VStack{
            ForEach(0..<3,id:\.self){ i in
                HStack{
                    ForEach(0..<3,id:\.self){ i in
                        ZStack(alignment: align[0]){
                            Color.black
                            ZStack{
                                Color.black
                                VStack(spacing: 2) {
                                    ForEach(0..<board.count,id:\.self){ row in
                                        HStack(spacing: 2) {
                                            ForEach(0..<board[row].count,id:\.self){column in
                                                ZStack{
                                                    Rectangle()
                                                        .fill(.white)
                                                }
                                            }
                                            
                                        }
                                    }
                                }.padding()
                            }
                        }
                    }
                }
            }
        }
    }
    
}

struct JadenView_Previews: PreviewProvider {
    static var previews: some View {
        JadenView()
    }
}
