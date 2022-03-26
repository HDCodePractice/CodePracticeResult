//
//  View Model.swift
//  GO
//
//  Created by Hendry shao on 2022-03-19.
//

import Foundation

struct ViewModel {
    var chessBoard : [[ChessBoardItem]] = []
    init(){
        let size = 18
        for _ in 1 ... size{
            var row : [ChessBoardItem] = []
            for _ in 1 ... size{
                row.append(ChessBoardItem(background: "Mid2.jpeg", chess: "no"))
            }
            chessBoard.append(row)
        }
    }
    mutating func change() {
        chessBoard[0][1]=ChessBoardItem(background: "Mid2.jpeg",chess: "no")
    }
    
}

struct ChessBoardItem: Identifiable,Hashable{
    let id:UUID = UUID()
    var background = "Mid2.jpeg"
    var chess = "no"
}
