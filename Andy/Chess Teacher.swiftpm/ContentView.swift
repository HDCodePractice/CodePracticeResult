import SwiftUI

struct ContentView: View {
    let zimu = ["A","B","C","D","E","F","G","H"]
    let num = ["8","7","6","5","4","3","2","1"]
    
    @State var vm = ViewModel()
    @State var move = movements()
    @State var select = ""
    @State var tile : [Int] = []
    @State var color : Color
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
                                Circle()
                                    .fill(vm.board[x][y].token.color)
                                Circle()
                                    .stroke(lineWidth: 5)
                                    .fill(vm.board[x][y].token.color == .clear ? .clear : .yellow)
                                     VStack{
                                    Text(vm.board[x][y].token.name)
                                        .foregroundColor(.blue)
                                }
                            }
                            .onTapGesture{
                                if select == ""{
                                    if vm.board[x][y].token.name != ""{
                                        select = vm.board[x][y].token.name
                                        color = vm.board[x][y].token.color
                                        vm.board[x][y].token.color = .red
                                        tile = [x,y]
                                    }
                                }else{
                                    print(color)
                                    if select == "Pawn"{
                                        if move.movePawn(begin:tile,end:[x,y],color:color) == true{
                                            vm.board[tile[0]][tile[1]].token.color = .clear
                                            vm.board[tile[0]][tile[1]].token.name = ""
                                            vm.board[x][y].token.color = color
                                            vm.board[x][y].token.name = select
                                            select = ""
                                        }else{
                                            select = ""
                                            vm.board[tile[0]][tile[1]].token.color = color
                                        }
                                    }else if select == "Rook"{
                                        if move.moveRook(begin:tile,end:[x,y]) == true{
                                            vm.board[tile[0]][tile[1]].token.color = .clear
                                            vm.board[tile[0]][tile[1]].token.name = ""
                                            vm.board[x][y].token.color = color
                                            vm.board[x][y].token.name = select
                                            select = ""
                                        }else{
                                            select = ""
                                            vm.board[tile[0]][tile[1]].token.color = color
                                        }
                                    }else if select == "Bishop"{
                                        if move.moveBishop(begin:tile,end:[x,y]) == true{
                                            vm.board[tile[0]][tile[1]].token.color = .clear
                                            vm.board[tile[0]][tile[1]].token.name = ""
                                            vm.board[x][y].token.color = color
                                            vm.board[x][y].token.name = select
                                            select = ""
                                        }else{
                                            select = ""
                                            vm.board[tile[0]][tile[1]].token.color = color
                                        }
                                    }
                                }
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
