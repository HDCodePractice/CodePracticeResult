import SwiftUI

struct Grid : Identifiable,Hashable{
    var id = UUID()
    var x : Int
    var y : Int
    var shipPiece : Int // -1: clicked Nothing 0:not clicked 1/2/3/4/5/6/7/8/9/10 第N条ship的piece
}

struct ContentView: View {
    let width = 10
    let height = 10
    let shipsNumber = 4
    let shipColors : [Color] = [.clear,.red,.gray,.blue,.cyan,.green,.mint,.yellow,.indigo,.orange,.brown]
    @State var p1score = 0
    @State var p2score = 0
    @State var a = 0
    @State var b = 0
    @State var ships : [[[Int]]] = []
    @State var collision : [[Int]] = []
    @State var board : [[Grid]] = []
    
    func startGame(){
        board = []
        for i in 0..<height{
            var row : [Grid] = []
            for j in 0..<width{
                row.append(Grid(x: i, y: j, shipPiece: 0))
            }
            board.append(row)
        }
        ships = buildShips()
    }
    func players()->Int{
        if b == 0{
            b = 1
            return 1
            
        }else{
            b = 0
            return 0
        }
    }
    func buildShips() -> [[[Int]]]{
        let startNumber = 2
        var shipCount = startNumber
        ships = []
        
        for _ in 1...shipsNumber{
            // H
            if [0,1].randomElement()==0{
                var startX : Int = Int.random(in: 0...width-shipCount)
                var startY : Int = Int.random(in: 0...height-1)
                var ship : [[Int]] = [[startX,startY]]
                a = 0
                while a == 0{
                    for i in 0..<collision.count{
                        if startX == collision[i][0] && startY == collision[i][1]{
                            startX = Int.random(in: 0...width-shipCount)
                            startY = Int.random(in: 0...height-1)
                        }else{
                            a = 1
                        }
                    }
                    
                    
                }
                for _ in 1...shipCount{
                    startX += 1
                    ship.append([startX,startY])
                    collision.append([startX,startY])
                }
                ships.append(ship)
            }else{ // V
                @State var startX : Int = Int.random(in: 0...width-1)
                @State var startY : Int = Int.random(in: 0...height-shipCount)
                var ship : [[Int]] = [[startX,startY]]
                a = 0
                while a == 0{
                    for i in 0..<collision.count{
                        if startX == collision[i][0] && startY == collision[i][1]{
                            startX = Int.random(in: 0...width-1)
                            startY = Int.random(in: 0...height-shipCount)
                        }else{
                            a = 1
                        }
                    }
                    
                    
                }
                for _ in 1...shipCount{
                    startY += 1
                    ship.append([startX,startY])
                    collision.append([startX,startY])
                }
                ships.append(ship)
            }
            shipCount += 1
        }
        return ships
    }
    // Check grid , return shipColors Index
    func checkTap(grid: Grid)->Int{
        for i in 0..<ships.count{
            if ships[i].contains([grid.x,grid.y]){
                if players() == 1{
                    p1score += 1
                }else{
                    p2score += 1
                }
                return i+1
            }
        }
        
        return 5
    }
    
    var body: some View {
        VStack{
            if players() == 1{
                Text("Player one is clicking")
                    .font(.largeTitle)
            }else{
                Text("Player two is clicking")
                    .font(.largeTitle)
            }
            HStack{
                Text("Player One Score: \(p1score) ")
                    .font(.largeTitle)
                
                Text("Player Two Score: \(p2score)")
                    .font(.largeTitle)
            }
            ForEach(board,id:\.self){ row in
                HStack{
                    ForEach(row){ grid in
                        ZStack{
                            Rectangle()
                            RoundedRectangle(cornerRadius: 10)
                                .fill(shipColors[grid.shipPiece])
                                .padding(2)
                        }
                        .onTapGesture {
                            var piece = grid
                            
                            piece.shipPiece = checkTap(grid: grid)
                            board[grid.x][grid.y]=piece
                        }
                    }
                }
            }
        }
        .padding()
        .onAppear { 
            startGame()
        }
    }
}

