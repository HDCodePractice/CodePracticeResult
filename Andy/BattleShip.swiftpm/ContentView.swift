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
    let shipsNumber = 5
    let shipColors : [Color] = [.clear,.red,.gray,.blue,.cyan,.green,.mint,.yellow,.indigo,.orange,.brown]
    @State var ships : [[[Int]]] = []
    @State var turn = "A"
    @State var A = 0
    @State var B = 0
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
        print(ships)
    }
    func buildShips() -> [[[Int]]]{
        var a = false
        while a == false{
            a = true
        
        let startNumber = 1
        var shipCount = startNumber
        ships = []
        
        for _ in 1...shipsNumber{
            // H
            if [0,1].randomElement()==0{
                var startX : Int = Int.random(in: 1...width-shipCount)
                var startY : Int = Int.random(in: 0...height-1)
                var ship : [[Int]] = [[startX-1,startY]]
                for _ in 1...shipCount{
                    ship.append([startX,startY])
                    startX += 1
                }
                ships.append(ship)
            }else{ // V
                var startX : Int = Int.random(in:0...width-1)
                var startY : Int = Int.random(in: 1...width-shipCount)
                var ship : [[Int]] = [[startX,startY-1]]
                for _ in 1...shipCount{
                    ship.append([startX,startY])
                    startY += 1
                }
                ships.append(ship)
            }
            shipCount += 1
        }
        
            
    }
        return ships
        }
    func checkTap(grid: Grid) -> Int{
        
        for i in 0..<ships.count{
            if ships[i].contains([grid.x,grid.y]){
                return i+1
            }
        }
        return 0
    }
    
    var body: some View {
        VStack{
            Text("\("next : ")\(turn)")
            
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
                            if piece.shipPiece > 0{
                                if turn == "A"{
                                    A+=1
                                    
                                }else{
                                    B+=1
                                }
                            }
                            switch turn{
                                case "A":
                                turn = "B"
                                
                                default:
                                turn = "A"
                                
                            }
                        }
                    }
                }
            }
            Text("\("player A : ")\(A)\("        player B : ")\(B)")
        }
        .padding()
        .onAppear { 
            startGame()
        }
    }
}
    

