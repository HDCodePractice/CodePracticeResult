import SwiftUI

struct ContentView: View {
    @State var vm = ChessViewModel()
    
    var body: some View {
            VStack(spacing:0){
                ForEach(vm.grid, id: \.self) { row in
                    HStack(spacing:0){
                        ForEach(row) {
                            item in
//                            ZStack {
//                                Rectangle().fill(item.background.color).frame(width: g.size.width/9, height: g.size.width/9).onTapGesture{
//
//
//                                }
//
//                                if (!item.chess.isHidden){
//                                    Image(systemName: item.chess.rawValue).resizable().scaledToFit().frame(width: g.size.width/13, height: g.size.width/13, alignment: .center)
//                                }
                            GridView(gridItem: item)
                            }
                        }
                    }
            }.scaledToFit().border(.black, width: 0.5).padding()
                
    }
}

struct GridView: View {
    @State var gridItem: GridItem
    var body: some View {
        GeometryReader { g in
        ZStack{
            Rectangle()
                .fill(Color.brown)
                .border(.black, width: 0.5)
            Image(systemName: gridItem.chess.rawValue).resizable().scaledToFit().padding(10)
        }.onTapGesture{
            gridItem.chess = gridItem.chess.nextChess
            
        }
        }
    }
}
