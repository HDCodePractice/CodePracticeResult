import SwiftUI

struct ContentView : View {
    @State var vm = ViewModel()
    var body: some View{
        VStack(spacing:0){
            ForEach(vm.chessBoard,id:\.self){row in
                HStack(spacing:0){
                    ForEach(row){ item in
                        GridItemView(item:item)
                    }
                }
            }
        }
    }
}
struct GridItemView : View {
    @State var item : ChessBoardItem
    @State var which = 0
    var body: some View {
        ZStack{
            Image(uiImage : UIImage(named: item.background)!)
                .resizable()
                .scaledToFit()
            if(item.chess != "no"){
                Image(uiImage : UIImage(named:item.chess)!)
                    .resizable()
                    .scaledToFit()
            }
        }.onTapGesture {
            which += 1
            if which % 2 != 0{
            item.chess = "black"
            }
            if which % 2 == 0{
                item.chess = "white"
            }
        }
    }
}
