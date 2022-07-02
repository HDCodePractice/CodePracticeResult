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
        if pieces[colum][row]==true{
            pieces[colum][row]=false
        }else{
            pieces[colum][row]=true
        }
        if pieceColors[colum][row] == .red{
            pieceColors[colum][row] = .white
        }else{
            pieceColors[colum][row] = .red
        }
    }
}
