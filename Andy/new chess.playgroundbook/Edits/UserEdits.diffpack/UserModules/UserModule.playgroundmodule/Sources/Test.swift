
public func test(){
    var vm = ViewModel()
    showBoard(vm: vm)
    
//    Pawn
    vm.tapGrid(grid: vm.board[6][1])
    vm.tapGrid(grid: vm.board[4][1])
    showBoard(vm: vm)
    vm.tapGrid(grid: vm.board[7][2])
    vm.tapGrid(grid: vm.board[5][0])     
    showBoard(vm: vm)
    vm.tapGrid(grid: vm.board[5][0])
    vm.tapGrid(grid: vm.board[3][2])     
    showBoard(vm: vm)
    
//    Knight
//    vm.tapGrid(grid: vm.board[7][1])
//    vm.tapGrid(grid: vm.board[4][1])
//    showBoard(vm: vm)
//    
//    vm.tapGrid(grid: vm.board[7][6])
//    vm.tapGrid(grid: vm.board[5][6])
//    showBoard(vm: vm)
//    
//    vm.tapGrid(grid: vm.board[7][6])
//    vm.tapGrid(grid: vm.board[6][5])
//    showBoard(vm: vm)
    
//    Rook
//    vm.tapGrid(grid: vm.board[6][0])
//    vm.tapGrid(grid: vm.board[4][0])
//    vm.tapGrid(grid: vm.board[7][0])
//    vm.tapGrid(grid: vm.board[5][0])
//    showBoard(vm: vm)
//    
//    vm.tapGrid(grid: vm.board[5][0])
//    vm.tapGrid(grid: vm.board[6][0])
//    showBoard(vm: vm)
}


func showBoard(vm : ViewModel) {
    var b = ""
    for line in vm.board{
        for item in line{
            b += "\(item.x)\(item.y)\(item.token.name),"
        }
        b += "\n"
    }
    print(b)
    print("===============================================")
}

