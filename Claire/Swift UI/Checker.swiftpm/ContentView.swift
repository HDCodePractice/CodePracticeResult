import SwiftUI

import SwiftUI

struct ContentView : View {
    @State var vm = ViewModel()
    var body: some View{
        ZStack{
            Color.gray
            HStack{
                ForEach(vm.grid,id:\.self){column in
                    VStack{
                        ForEach(column){item in
                            Image(systemName: item.connect.imageName)
                                .foregroundColor(item.connect.color)
                            
                        }
                    }
                }
            }
        }.ignoresSafeArea()

    }
}

//struct GridItemView: View {
//    @State var item : GridItem
//
//    var body: some View {
////        ZStack{
////            Rectangle()
////                .fill(item.background.color)
////                .frame(width: 30, height: 30)
////                .border(.black, width: 1)
////            Image(systemName: item.checker.rawValue)
////        }
////        .onTapGesture{
////            item.checker = item.checker.nextchecker
////        }
//        ZStack{
//            Circle()
//                .fill(item.background.color)
//                .frame(width: 40, height: 40)
//            Image(systemName: item.connect.rawValue)
//        }
//    }
//}
