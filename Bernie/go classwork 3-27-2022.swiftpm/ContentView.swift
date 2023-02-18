import SwiftUI

struct ContentView: View {
    @State var vm = ViewModel()
    var body: some View {
        VStack(spacing:0){
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


struct GridItemView: View {
    @State var item: GridItem
    
    var body: some View {
        ZStack{
            Image(item.background.name)
                .resizable()
                .scaledToFit()
            Circle()
                .fill(item.go.color)
                .frame(width: 15, height: 15)
                .padding(1)
        }
        .onTapGesture{
            item.go = item.go.nextGo
        }
    }
}


