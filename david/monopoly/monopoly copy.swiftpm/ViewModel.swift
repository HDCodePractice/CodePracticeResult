import SwiftUI

struct ViewModel{
    var  lands:[[Land]] = []
    var chessLocation:[[Chess]]=[]
    var finalX = 10
    var finalY = 10
    var counts = 0
    
    init(){
        let names = [
            ["1,0","2,0","3,0","4,0","5,0","6,0","7,0","8,0","9,0"],
            ["0,1","0,2","0,3","0,4","0,5","0,6","0,7","0,8","0,9"],
            ["10,1","10,2","10,3","10,4","10,5","10,6","10,7","10,8","10,9"],
            ["1,10","2,10","3,10","4,10","5,10","6,10","7,10","8,10","9,10"]
            //            ["1westmount1","2westmount2","3westmount3","4westmount4","5westmount5","6westmount6","7westmount7","8westmount8","9westmount9"],
            //            ["1oldport1","2oldport2","3oldport3","4oldport4","5oldport5","6oldport6","7oldport7","8oldport8","9oldport9"],
            //            ["NDG1","NDG2","NDG3","NDG4","NDG5","NDG6","NDG7","NDG8","NDG9"],
            //            ["1ChinaTown1","2ChinaTown2","3ChinaTown3","4ChinaTown4","5ChinaTown5","6ChinaTown6","7ChinaTown7","8ChinaTown8","9ChinaTown9"]
        ]
        
        
        for i in 0..<4{
            var line = [Land]()
            for x in 0..<9{
                line.append(Land(name: names[i][x], image: nil, color: .cyan))
            }
            lands.append(line)
        }
        emptyChess()
        
//                for i in 0..<11{
//                    var line:[Chess]=[]
//                    for j in 0..<11{
//                        line.append(Chess(chessColor: .clear, x: j, y: i))
//                    }
//                    chessLocation.append(line)
//                }
        
    }
    
    mutating func emptyChess(){
        for y in 0..<11{
            var line:[Chess]=[]
            for x in 0..<11{
                line.append(Chess(chessColor: .clear, x: x, y: y))
            }
            chessLocation.append(line)
        }
    }
    
    mutating func startGame(){
//        emptyChess()
        chessLocation[10][9].chessColor = .red
        print(chessLocation)
        
    }
    
    mutating func movingChess(steps:Int){
        //        var chessLocation = chessLocation
        
        for y in 0..<11{
            for x in 0..<11{
                var chess = chessLocation[y][x]
                if chess.chessColor != .clear{
                    
                    finalX = chess.getNextLocation(chess: chess, steps: steps).x
                    finalY = chess.getNextLocation(chess: chess, steps: steps).y
                    
                    chessLocation[x][y].chessColor = .clear
                    
//                    print("x:\(finalX)","y:\(finalY)","steps:\(steps)")
                    
                    chessLocation[finalX][finalY] = Chess(chessColor: .red, x: finalX, y: finalY)
//                    chessLocation[finalY][finalX] = Chess(chessColor: .red, x: finalX, y: finalY)
                    
                    
                    print(chessLocation)
                    print("checking:\(checking(chessLoction: chessLocation))")
                    counts += 1
                    print("counts = \(counts)")
                    print("x.start=\(chessLocation[finalX][finalY].x)")
                    print("y.start=\(chessLocation[x][y].y)")
                    
                    return
                }
            }
        }
    }
    
    func gridName(_ x:Int, _ y:Int) -> String{
        if y==0 && x>0 && x<10{
            return lands[0][x-1].name
        }
        if x==0 && y>0 && y<10{
            return lands[1][y-1].name
        }
        if x==10 && y>0 && y<10{
            return lands[2][y-1].name
        }
        if y==10 && x>0 && x<10{
            return lands[3][x-1].name
        }
        return ""
    }
    
    func fillColor(_ x: Int, _ y:Int) -> Color {
        if x==0 || y==0 || x==10 || y==10{
            return .cyan
        }
        return .clear
    }
    
    func dice(diceCode:Int)->([Alignment]){
        let site:[Alignment] =
        [.topLeading,.top,.topTrailing,
         .leading,.center,.trailing,
         .bottomLeading,.bottom,.bottomTrailing]   
        let siteCode = [[4,4,4,4,4,4],[0,0,0,8,8,8],[0,4,4,4,4,8],[0,0,2,6,8,8],[0,2,4,4,6,8],[0,2,3,5,6,8]]
        
        var dotSite:[Alignment] = []
        for i in siteCode[diceCode-1]{
            dotSite.append(site[i])
        }
        return (dotSite)
    }
}


func checking(chessLoction:[[Chess]])->(x:Int,y:Int){
    var xx = 10
    var yy = 10
    for y in 0..<chessLoction.count{
        for x in 0..<chessLoction[y].count{
            if chessLoction[y][x].chessColor != .clear{
                xx = x
                yy = y
            }
        }
    }
    return(xx,yy)
}
