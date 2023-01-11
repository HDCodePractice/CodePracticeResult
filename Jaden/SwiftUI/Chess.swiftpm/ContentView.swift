import SwiftUI

struct ContentView: View {
    let zimu = ["A","B","C","D","E","F","G","H"]
    let num = ["8","7","6","5","4","3","2","1"]
    
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
                ForEach(0..<8,id:\.self){ x in
                    HStack(spacing:1){
                        ZStack{
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 20)
                            Text(num[x])
                                .foregroundColor(.black)
                        }
                        ForEach(0..<8,id:\.self){ y in
                            ZStack{
                                Rectangle()
                                    .fill(vm.board[x][y].color)
                                VStack{
                                    Text(vm.board[x][y].token.name)
                                        .foregroundColor(.blue)
                                }
                            }
                            .onTapGesture {
                                vm.tapGrid(grid: vm.board[x][y])
                            }
                        }
                        ZStack{
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 20)
                            Text(num[x])
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
