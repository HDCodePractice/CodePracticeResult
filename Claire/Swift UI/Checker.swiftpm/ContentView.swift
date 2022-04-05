import SwiftUI

struct ContentView: View {
    @State var vm = ViewModel()
    
    var body: some View {
        background(Color.gray)
        VStack(spacing:-1) {
//            ForEach(vm.grid, id:\.self){ row in
//                HStack(spacing:-1){
//                    ForEach(row){item in
//                        GridItemView(item: item)
//                    }
//                }
//            }
            ForEach(vm.grid, id:\.self){ row in
                ForEach(row) { item in
                    GridItemView(item:)
                }
            }
        }
    }
}

struct GridItemView: View {
    @State var item : GridItem
    
    var body: some View {
//        ZStack{
//            Rectangle()
//                .fill(item.background.color)
//                .frame(width: 30, height: 30)
//                .border(.black, width: 1)
//            Image(systemName: item.checker.rawValue)
//        }
//        .onTapGesture{
//            item.checker = item.checker.nextchecker
//        }
        ZStack{
            Circle()
                .fill(item.background.color)
                .frame(width: 40, height: 40)
            Image(systemName: item.connect.rawValue)
        }
    }
}
