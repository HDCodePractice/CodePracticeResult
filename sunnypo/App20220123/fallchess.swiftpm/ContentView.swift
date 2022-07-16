import SwiftUI


struct ContentView: View {
    @State var vm = ViewModel()
    var body: some View{
        ZStack{
            VStack(spacing:0){
                Rectangle().fill(.gray).cornerRadius(15)
                
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
            }.frame(width: 263, height: 213)
        }.frame(width: 300, height: 250)
    }
}

struct GridItemView : View {
    @State var item : GridItem
    var body: some View{
        ZStack{
            Rectangle()
                .fill(.yellow).border(.black).hidden()
            Circle().foregroundColor(.white)
            Image(item.chess.rawValue).resizable().scaledToFit().foregroundColor(.red)
        }.onTapGesture {
            switch item.chess {
            case .orange:
                item.chess = .nothing
            case .blue:
                item.chess = .orange
            default:
                item.chess = .blue
            }
        }
    }
}
