import SwiftUI

class ViewModel:ObservableObject{
    @Published var pieces : [[Bool]] = [
        [true,true,true,true,true,true],
        [true,true,true,true,true,true],
        [true,true,true,true,true,true],
        [true,true,true,true,true,true],
        [true,true,true,true,true,true],
        [true,true,true,true,true,true],
        [true,true,true,true,true,true],
        [true,true,true,true,true,true]
    ]
    @Published var pieceColors : [[Color]] = [
        [.red,.red,.red,.red,.red,.red],
        [.red,.red,.red,.red,.red,.red],
        [.red,.red,.red,.red,.red,.red],
        [.red,.red,.red,.red,.red,.red],
        [.red,.red,.red,.red,.red,.red],
        [.red,.red,.red,.red,.red,.red],
        [.red,.red,.red,.red,.red,.red],
        [.red,.red,.red,.red,.red,.red]
    ]
    
    func tapPice(colum:Int,row:Int){
//        if pieces[colum][row]==true{
//            pieces[colum][row]=false
//        }else{
//            pieces[colum][row]=true
//        }
        pieces[colum] = tapColum(column: pieces[colum])
        if pieceColors[colum][row] == .red{
            pieceColors[colum][row] = .white
        }else{
            pieceColors[colum][row] = .red
        }
    }
    
    func tapColum(column: [Bool])->[Bool]{
        var c = column
        for i in 0...c.count-1 {
            let index = c.count - i - 1
            if c[index]==true{
                c[index]=false
                break
            }
        }
        return c
    }
}
