import SwiftUI
struct Cord {
    var cord : [Int] = [1,2,3,4,5,6,7,8]
    var line : [Int] = [1,2,3,4,5,6,7,8]
}

struct ContentView: View {
    var cd = Cord()
    var body: some View {
        HStack (spacing:0){
            ForEach(cd.cord,id: \.self)
            { i in
                VStack (spacing:0){
                    ForEach(cd.line,id: \.self)
                    { k in
                        if (k+i) % 2 != 1 {
                            Rectangle().fill(.cyan)
                        }else{
                            if k < 4 {
                                BlackSlot(isKing: false, white: true, black: false)
                            }else if k > 5 {
                                BlackSlot(isKing: false, white: false, black: true)
                            }else {
                                BlackSlot(isKing: false, white: false, black: false)
                            }
                        }
                    }
                }
            }
        }.frame(width: 300, height: 300).border(.red)
    }
}
