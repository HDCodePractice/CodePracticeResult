import SwiftUI

struct ContentView: View {
    let zimu = ["A","B","C","D","E","F","G","H"]
    let num = ["1","2","3","4","5","6","7","8"]
    
    @State var vm = ViewModel()
    
    var body: some View {
        ZStack{
            Color.white
            VStack(spacing:1) {
                HStack(spacing:1){
                    Rectangle()
                        .fill(.clear)
                        .frame(width: 20,height: 20)
                    ForEach(zimu,id:\.self){ t in
                        ZStack{
                            Rectangle()
                                .fill(.clear)
                                .frame(height: 20)
                            Text(t)
                                .foregroundColor(.black)
                        }
                    }
                    Rectangle()
                        .fill(.clear)
                        .frame(width: 20,height: 20)
                }
                ForEach(0..<8,id:\.self){ y in
                    HStack(spacing:1){
                        ZStack{
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 20)
                            Text(num[y])
                                .foregroundColor(.black)
                        }
                        ForEach(0..<8,id:\.self){ x in
                            ZStack{
                                Rectangle()
                                    .fill(vm.board[y][x].color)
                                Text(vm.board[y][x].token.name)
                                    .foregroundColor(vm.board[y][x].token.color)
                            }
                            .onTapGesture {
                                vm.tapGrid(grid: vm.board[y][x])
                            }
                        }
                        ZStack{
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 20)
                            Text(num[y])
                                .foregroundColor(.black)
                        }
                    }
                }
                HStack(spacing:1){
                    Rectangle()
                        .fill(.clear)
                        .frame(width: 20,height: 20)
                    ForEach(zimu,id:\.self){ t in
                        ZStack{
                            Rectangle()
                                .fill(.clear)
                                .frame(height: 20)
                            Text(t)
                                .foregroundColor(.black)
                        }
                    }
                    Rectangle()
                        .fill(.clear)
                        .frame(width: 20,height: 20)
                }
            }
            .padding()
            .border(.black, width: 2)
            .padding()
        }
    }
}
