import SwiftUI

struct ContentView : View {
    @State var vm = ViewModel()
    var body: some View{
        VStack(spacing:0){
            ForEach(vm.chessBoard,id:\.self){row in
                HStack(spacing:0){
                    ForEach(row){ item in
                        GrideItemView(item: item)
                    }
                }
            }
        }
    }
}

struct GrideItemView : View{
    @State var x = 1
    @State var item : ChessBoardItem
    var body: some View{
        ZStack{
            Image(item.background)
                .resizable()
                .scaledToFit()
            if (item.chess != "no"){
                Image(item.chess)
                    .resizable()
                    .scaledToFit()
            }

        }
        .onTapGesture {
            if x == 1{
                item.chess = "3"
                x = 2
            }else if x == 2{
                item.chess = "2"
                x = 1
            }

        }
    }
}
