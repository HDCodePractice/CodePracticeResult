import SwiftUI

struct ContentView: View {
    @State var vm = ViewModel()
    var body: some View{
        VStack (spacing:0){
            ForEach(vm.grid,id: \.self){ row in
                HStack (spacing:0) {
                    ForEach(row,id: \.self)
                    { item in
                        GridItemView(item: item)
                    }
                }

            }
        }.frame(width: 200, height: 200)
    }
}

struct GridItemView : View {
    @State var item : GridItem
    var body: some View{
        ZStack{
            Rectangle()
                .fill(item.background.color)
            Image(systemName: item.chess.rawValue).resizable().scaledToFit().foregroundColor(.red)
        }.onTapGesture {
            switch item.chess {
            case .white:
                item.chess = .black
            case .black:
                item.chess = .white
            default:
                item.chess = .white
            }
        }
    }
}
