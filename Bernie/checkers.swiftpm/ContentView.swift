import SwiftUI

struct ContentView: View {
    @State var vm = ViewModel()
    var body: some View {
        VStack(spacing:0){
            ForEach (vm.grid, id:\.self){row in
                HStack(spacing:0){
                    ForEach (row){item in
                        GridItemView(item: item)
//                        ZStack{
//                            Rectangle()
//                                .fill(item.background.color)
//                            if !item.chess.isHidden{
//                                Image(systemName: item.chess.rawValue)
//                                    .resizable()
//                                    .scaledToFit()
//                                    .foregroundColor(.gray)
//                                    .padding(2)
//                            }
                        }
//                        .frame(width: 30, height: 30)
                    }
                }
            }
//        }.border(.black,width:1.0).padding()
//        .scaleEffect()
//        .scaledToFit()
        
    }
    
}

struct GridItemView : View{
    @State var item : GridItem
    var body: some View{
        ZStack{
            Rectangle()
                .fill(item.background.color)
            Image(systemName:item.chess.rawValue)
                .resizable()
                .scaledToFit()
                .foregroundColor(.red)
                .padding(2)
        }
        .onTapGesture{
            item.chess = item.chess.nextChess
    }
        .frame(width: 30, height: 30)
    }
}


