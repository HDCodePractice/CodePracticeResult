import SwiftUI

class ViewModel:ObservableObject {
    @Published var pieces : [[Bool]] = [
        [true, true, true, true, true, true],
        [true, true, true, true, true, true],
        [true, true, true, true, true, true],
        [true, true, true, true, true, true],
        [true, true, true, true, true, true],
        [true, true, true, true, true, true],
        [true, true, true, true, true, true]
        
    ]
    @Published var pieceColors : [[Color]] = [
        [.red,.red,.red,.red,.red,.red],
        [.red,.red,.red,.red,.red,.red],
        [.red,.red,.red,.red,.red,.red],
        [.red,.red,.red,.red,.red,.red],
        [.red,.red,.red,.red,.red,.red],
        [.red,.red,.red,.red,.red,.red],
        [.red,.red,.red,.red,.red,.red]
        
    ]
    
    func tapPiece(column:Int,row:Int){
//        if pieces[column][row]==true{
//            pieces[column][row]=false
//        }else{
//            pieces[column][row]=true
//        }
        pieces[column] = tapColumn(column: pieces[column])
        if pieceColors[column][row] == .red{
            pieceColors[column][row] = .white
        }else{
            pieceColors[column][row] = .red
        }
        
    }
    
    func tapColumn(column: [Bool])->[Bool]{
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
