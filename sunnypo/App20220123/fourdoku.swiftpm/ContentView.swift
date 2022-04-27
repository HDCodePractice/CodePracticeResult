import SwiftUI

import SwiftUI


struct ContentView: View {
    @State var vm = ViewModel()
//    @State var gm = Game()
    var body: some View{
        gamePlay
    }
    var gamePlay: some View{
        VStack{
            ZStack{
                ZStack{
                    VStack(spacing:2){
                        HStack(spacing:2){
                            Image("chunk").resizable().scaledToFit().opacity(0.25)
                            Image("chunk").resizable().scaledToFit().opacity(0.25)
                        }
                        HStack(spacing:2){
                            Image("chunk").resizable().scaledToFit().opacity(0.25)
                            Image("chunk").resizable().scaledToFit().opacity(0.25)
                        }
                    }
                }

                VStack (spacing:2){
                    ForEach(vm.grid,id: \.self){ row in
                        HStack (spacing:2) {
                            ForEach(row,id: \.self)
                            { item in
                                GridItemView(item: item)
                            }
                        }

                    }
                }.padding(2)
            }.aspectRatio(1.0, contentMode: .fit)
            HStack(spacing:0){
                Image("one").resizable().scaledToFit().padding(2).onTapGesture {
                    gm.selectedNumber = 1
                }
                Image("two").resizable().scaledToFit().padding(2).onTapGesture {
                    gm.selectedNumber = 2
                }
                Image("three").resizable().scaledToFit().padding(2).onTapGesture {
                    gm.selectedNumber = 3
                }
                Image("four").resizable().scaledToFit().padding(2).onTapGesture {
                    gm.selectedNumber = 4
                }
                Image("delete").resizable().scaledToFit().padding(2).onTapGesture {
                    gm.selectedNumber = 5
                }
            }
        }.padding(4)

    }
}

struct GridItemView : View {
    @State var item : GridItem
    var body: some View{
        ZStack{
            Image(item.numberButton.rawValue).resizable().scaledToFit().foregroundColor(.red)
        }.onTapGesture {
            switch item.numberButton {
            case .one:
                item.numberButton = .two
            case .two:
                item.numberButton = .three
            case .three:
                item.numberButton = .four
            case .four:
                item.numberButton = .nothing
            default:
                item.numberButton = .one
                
            }
        }
    }
}

//
//struct Game {
//    @State var selectedNumber : Int = 0
//    mutating func syncing(){
//        if selectedNumber != 0{
//            selectedNumber = 0
//        }
//    }
//
//}
