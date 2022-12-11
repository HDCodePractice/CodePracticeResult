import SwiftUI

struct Chess{
    var chessColor:Color = .clear
    var x = 10
    var y = 10
    
    
//    mutating func startGame(){
//        var player1 = Chess(chessColor: .red, x: 10, y: 10)
//        //        var player2 = Chess(chessColor: .yellow, x: 10, y: 10)
//    }
    
    mutating func getNextLocation(chess:Chess,steps:Int)->(x:Int,y:Int){
        var chess:Chess = chess
        var x = chess.x
        var y = chess.y
        
//        chess.chessColor = .clear
        
        if y==10 && x-steps>=0{
            y = 10
            x = x-steps
            print(11111111)
        }else if y==10 && x-steps<0{
            y = 10-(steps-x)
            x = 0
            print(22222222)
        }else if x==0 && y-steps>=0{
            y = y - steps
            x = 0
            print(333333333)
        }else if x==0 && y-steps<0{
            x = (steps - y)
            y = 0
            print(44444444444)
        }else if y==0 && x+steps <= 10{
            x = x + steps
            y = 0
            print(5555555555)
        }else if y==0 && x+steps>10{
            x = 10
            y = x+steps-10
            print(66666666666)
        }else if x==10 && y+steps<=10{
            x = 10
            y = y+steps
            print(7777777777)
        }else if x==10 && y+steps>10{
            x = 20-(y+steps)
            y = 10
            print(8888888888)
        }
        
        chess = Chess(chessColor: .yellow, x: x, y: y)
        
//        print("x:\(x),y:\(y)")
        return (x,y) 
    }
}

