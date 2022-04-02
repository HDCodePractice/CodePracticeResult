//
//  ViewModel.swift
//  Go
//
//  Created by Jaden Cheung on 3/19/22.
//

import Foundation

struct ViewModel {
    var chessBoard : [[ChessBoardItem]] = []
    init(){
        let size = 2
        
        for _ in 1 ... size{
            var row:[ChessBoardItem] = []
            for _ in 1 ... size{
                row.append(ChessBoardItem(background: "Mid2", chess: "no"))
            }
            chessBoard.append(row)
        }
    }
    
    mutating func change() {
        chessBoard[0][1]=ChessBoardItem(background: "Mid2",chess: "no")
    }
    
}

struct ChessBoardItem: Identifiable,Hashable{
    let id:UUID = UUID()
    var background = "Mid2"
    var chess = "no"
}

