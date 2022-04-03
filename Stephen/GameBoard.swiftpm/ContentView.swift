import SwiftUI

struct ContentView: View{
    @State var vm = ViewModel()
        
    var body: some View{
        VStack(spacing: 0){
            ForEach (vm.grid, id:\.self){row in
                HStack( spacing: 0){
                    ForEach(row){item in
//                        ZStack{
//                            Rectangle()
//                                .fill(item.background.color)
//                                .onTapGesture {
//                                    <#code#>
//                                }
//                            if !item.chess.isHidden{
//                                Image(systemName: item.chess.rawValue
//                                )
//                                .resizable()
//                                .scaledToFit()
//                                .foregroundColor(.blue)
//                                .padding(4)
//                            }
//                        }
//                        .frame(width: 50, height: 50)
                        GridItemView(item: item)
                    }
                }
            }
        }.border(.black, width: 2).padding()
    }
}


struct GridItemView: View{
    @State var item :  GridItem
    
    var body: some View{
        ZStack{
            Rectangle()
                .fill(item.background.color)
                Image(systemName: item.chess.rawValue)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.blue)
                        .padding(4)
        }
        .frame(width: 50, height: 50)
        .onTapGesture {
            item.chess = item.chess.nextChess
            }
            
        }
    }
