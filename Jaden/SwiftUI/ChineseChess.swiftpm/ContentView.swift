import SwiftUI

struct ContentView : View {
    @State var vm = ViewModel()
    var body: some View{
        VStack(spacing:0){
            ForEach(vm.grid,id:\.self){row in
                HStack(spacing:0){
                    ForEach(row){ item in
                        GridItemView(item: item)
                    }
                }
            }
        }
    }
}

struct GridItemView : View{
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
            item.background = item.checker.nextConnect

        }
    }
}
