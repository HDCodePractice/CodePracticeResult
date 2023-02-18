import SwiftUI


struct ContentView: View {
    @State var vm = ViewModel()
    let block = [1,2,3,4,5,6,7,8,9,10,11,12]
    var body: some View{
        ZStack{
            VStack(spacing:0){
                ForEach(block,id: \.self){row in
                    HStack(spacing:0){
                        ForEach(block,id: \.self){ colume in
                            if row == 1 || row == 12 || colume == 1 || colume == 12 {
                                Rectangle().fill(.yellow)
                            }else {
                                Rectangle().fill(.yellow).border(.black)
                            }
                        }
                    }
                }
            }
            VStack (spacing:10){
                ForEach(vm.grid,id: \.self){ row in
                    HStack (spacing:10) {
                        ForEach(row,id: \.self)
                        { item in
                            GridItemView(item: item)
                        }
                    }

                }
            }.frame(width: 263, height: 263)
        }.frame(width: 300, height: 300)
    }
}

struct GridItemView : View {
    @State var item : GridItem
    var body: some View{
        ZStack{
            Rectangle()
                .fill(.yellow).border(.black).hidden()
            Image(item.chess.rawValue).resizable().scaledToFit().foregroundColor(.red)
        }.onTapGesture {
            switch item.chess {
            case .white:
                item.chess = .black
            case .black:
                item.chess = .nothing
            default:
                item.chess = .white
            }
        }
    }
}
