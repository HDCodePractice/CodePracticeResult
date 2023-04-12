import SwiftUI
// down at bottom read grid

struct ContentView: View {
    let zimu = ["A","B","C","D","E","F","G","H"]
    let num = ["1","2","3","4","5","6","7","8"]
    
    @State var vm = ViewModel()
    @State var turn = true
    @State var prev : [[Grid]] = []
    @State var showProm : Bool = false
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
                                if vm.last == nil{
                                    print("1")
                                    if turn == true{
                                        print("1.5")
                                        if vm.board[y][x].token.color == .white{
                                            vm.tapGrid(grid:vm.board[y][x])
                                            turn.toggle()
                                        }
                                    }else{
                                        print("2")
                                        if vm.board[y][x].token.color == .black{
                                            vm.tapGrid(grid:vm.board[y][x])
                                            turn.toggle()
                                        }
                                    }
                                }else{
                                    print("3")
                                    vm.tapGrid(grid:vm.board[y][x])
                                    print(showProm)
                                    for i in 0...7{
                                        if vm.board[0][i].token.name == "Pawn"{
                                            print("11")
                                                showProm = true
                                        }else if vm.board[7][i].token.name == "Pawn"{
                                            print("2")
                                                showProm = true
                                        }
                                    }
                                }
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
            
            if showProm == true{
                ZStack{
                    RoundedRectangle(cornerRadius:25)
                    VStack{
                        Text("Promote pawn to:")
                            .foregroundColor(.accentColor)
                        ForEach(["Queen","Rook","Bishop","Knight"],id:\.self){ i in
                            Button(i){
                                vm.promote = i
                                showProm = false
                            }.buttonStyle(.borderedProminent)
                        }
                    }
                }
            }
            if vm.mate != .clear{
                Rectangle()
                    .fill(vm.mate)
                winScreen(player1: Player(color: .black, name:"Black", score: 1), player2: Player(color: .white, name:"White",score: 0), reason: "Imagine resigning lmao")
            }
        }
            Button("Resign"){
                vm.mate = .black
                print(vm.mate)
            }
        
    }
}
