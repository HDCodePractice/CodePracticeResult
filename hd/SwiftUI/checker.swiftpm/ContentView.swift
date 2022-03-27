import SwiftUI

struct ContentView: View {
    @State var vm = ViewModel()
    
    var body: some View {
        VStack(spacing:-1) {
            ForEach(vm.grid,id:\.self){ row in
                HStack(spacing:-1){
                    ForEach(row){item in
                        GridItemView(item: item)
                    }
                }
            }
        }
    }
}

struct GridItemView: View {
    @State var item : GridItem
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(item.background.color)
                .frame(width: 30, height: 30)
                .border(.black, width: 1)
            Image(systemName: item.checker.rawValue)
        }
        .onTapGesture {
            item.checker = item.checker.nextchecker
        }
    }
}
