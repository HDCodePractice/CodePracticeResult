import SwiftUI

struct ContentView: View {
    @State var vm = ViewModel()
    
    @State var chess = Chess()
    @State var steps:Int = 3
    @State var degrees = 0.0
    @State var toggle = false
    
    var body: some View {
        ZStack{
            VStack(spacing: 3){
                ForEach(0..<11,id:\.self){y in
                    HStack(spacing: 3){
                        ForEach(0..<11,id:\.self){x in
                            ZStack{
                                Rectangle()
                                    .fill(.cyan)
                                VStack{
                                    Text("\(x),\(y)")
                                    
                                    if x == vm.x && y == vm.y{
                                        Text("\(vm.chessLocation[y][x])")
                                            .bold()
                                    }
                                    
                                }
                            }
                        }
                    } // HStack
                }
            } // VStack
            
            
        }
        .border(.primary)
        .padding()
    }
}
