import SwiftUI

struct ContentView: View {
    @State var vm = ViewModel()
    
    var body: some View {
        VStack(spacing:0){
            ForEach (vm.gride,id:\.self) { row in
                HStack(spacing:0){
                    ForEach (row) {item in
                        grideItemView(item: item)
                    }
                }
            }
        }
        
    }
}

struct  grideItemView:View {
    @State var item : GridItem
    var body: some View {
        ZStack{
            Image(item.background.rawValue)
                .resizable()
                .scaledToFit()
                
            if !item.chess.isHidden{
                Image(item.chess.rawValue)
                    .resizable()
                    .scaledToFit()
            }
        }
        .onTapGesture{
            item.chess = item.chess.nextChess
        }
    }
}
