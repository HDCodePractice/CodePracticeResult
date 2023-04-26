import SwiftUI

struct BoardView: View {
    var vm: ViewModel
    
    var body: some View {
        VStack(spacing: 3){
            ForEach(0..<11,id:\.self){y in
                HStack(spacing: 3){
                    ForEach(0..<11,id:\.self){x in
                        ZStack{
                            Rectangle()
                                .fill(vm.fillColor(x, y))
                            VStack{
                                Text(vm.gridName(x,y))
                                 Text("\(x),\(y)")
                            }
                            PlayerView(player: vm.players[0], x: x, y: y)
                            VStack{
                                Rectangle()
                                    .fill(.clear)
                                Rectangle()
                                    .fill(.clear)
                                Rectangle()
                                    .fill(.clear)
                                Rectangle()
                                    .fill(.red)
                                    .opacity(0.5)
                            }
                        }
                    }
                } // HStack
            }
        } // VStack
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView(vm: ViewModel())
    }
}
