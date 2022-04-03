import SwiftUI

struct ContentView: View {
    @State var vm = ViewModel()
    var body: some View {
        VStack(spacing:0) {
            ForEach(vm.grid, id:\.self){ row in
                HStack(spacing:0){
                    ForEach(row){item in
                        GridItemView(item: item)
                        
                    }
                }
            }
        }
    }
}

struct GridItemView : View{
    @State var item: GridItem
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(item.background.color)
            Circle()
                .fill(item.connet4.color)
                .scaledToFit()
                .frame(width: 15, height: 15)
                .padding(2)
            Image(systemName:item.connet4.rawValue)
//                .fill(item.connet4.color)
                .resizable()
                .scaledToFit()
                .padding(2)
        }.onTapGesture{
            item.connet4 = item.connet4.nextConnect4
        }
        .frame(width: 30, height: 30)
    }
}
