func genBoard() -> [[[String]]]{
    var l : [[[String]]] = []
    for i in 0 ... 9{
        l.append([])
        for j in 0...9{
            l[i].append([])
            l[i][j] = ["","\(i)","\(j)"]
        }
    }
    return l
}
func buildShips() -> [[[String]]]{
    var ships = genBoard()
    var x = 0
    var y = 0
    var lmao = false
    for i in 2 ... 6{
        var direction = Int.random(in:1...2)
        if direction == 1{
            x = Int.random(in:0...9)
            y = Int.random(in:0...9-i)
            for j in y ... y+i-1{
                if ships[x][j][0] != ""{
                    lmao = true
                }
                ships[x][j][0] = ("\(i)")
            }
        }
        if direction == 2{
            x = Int.random(in:0...9-i)
            y = Int.random(in:0...9)
            for l in x ... x+i-1{
                if ships[l][y][0] != ""{
                    lmao = true
                }
                ships[l][y][0] = ("\(i)")
            }
        }
    }
    if lmao == false{
        return ships
    }
    return [[["no"]]]
            
    
    
}
func getRightAnswer() -> [[[String]]]{
    var a : [[[String]]] = [[["no"]]]
    while a == [[["no"]]]{
        a = buildShips()
    }
    
    return a
}



import SwiftUI
struct ContentView: View {
    @State var board : [[[String]]] = getRightAnswer()
    @State var turn = "b"
    @State var a = 0
    @State var b = 0
    
    
    
    
    var body: some View {
        
        VStack(spacing:0){
            
            ForEach(board,id:\.self){
                row in HStack(spacing:0){
                    
                    ForEach(row,id:\.self){
                        grid in 
                        
                        ZStack{
                            
                            
                            Rectangle()
                                .stroke(lineWidth: 10)
                            Rectangle()
                                .fill(.black)
                            if grid[0] == "rev2"{
                                Circle()
                                    .fill(.red)
                            }
                            if grid[0] == "rev3"{
                                Circle()
                                    .fill(.yellow)
                            }
                            if grid[0] == "rev4"{
                                Circle()
                                    .fill(.green)
                            }
                            if grid[0] == "rev5"{
                                Circle()
                                    .fill(.blue)
                            }
                            if grid[0] == "rev6"{
                                Circle()
                                    .fill(.white)
                            }
                        }
                        .onTapGesture {
                            switch turn{
                                case "a":
                                turn = "b"
                                default:
                                turn = "a"
                            }
                            let x1 = Int(grid[1])!
                            let y1 = Int(grid[2])!
                            let z = board[x1][y1][0]
                            switch z {
                                
                                case "2":
                                board[x1][y1][0] = "rev2"
                                if turn == "a"{
                                    a += 1
                                }else{
                                    b += 1
                                }
                            case "3":
                                if turn == "a"{
                                    a += 1
                                }else{
                                    b += 1
                                }
                                board[x1][y1][0] = "rev3"
                            case "4":
                                if turn == "a"{
                                    a += 1
                                }else{
                                    b += 1
                                }
                                board[x1][y1][0] = "rev4"
                            case "5":
                                if turn == "a"{
                                    a += 1
                                }else{
                                    b += 1
                                }
                                board[x1][y1][0] = "rev5"
                            case "6":
                                if turn == "a"{
                                    a += 1
                                }else{
                                    b += 1
                                }
                                board[x1][y1][0] = "rev6"
                                default:
                                board = board
                            }
                        }
                    }
                }
            }
            Text("player A:\(a),player B:\(b)")
                .font(.largeTitle)
    }
}
}
