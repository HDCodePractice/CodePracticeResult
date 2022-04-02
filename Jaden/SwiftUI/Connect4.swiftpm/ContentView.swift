import SwiftUI

struct ContentView : View {
    @State var vm = ViewModel()
    var body: some View{
        ZStack{
            Color.gray
//            VStack{
//                VStack(spacing:-1){
//                    ForEach(vm.grid,id:\.self){row in
//                        HStack(spacing:-1){
//                            ForEach(row){item in
//                                GridItemView(item:item)
//                            }
//                        }
//                    }
//                }
//            }
        }.ignoresSafeArea()

    }
}
//struct GridItemView: View {
//    @State var item : Connect
//    var body: some View {
//        ZStack{
//            Image(systemName: item.imageName)
//                .onTapGesture {
//                    item.connect = item.connect.color
//                }
//        }
//    }
//}
