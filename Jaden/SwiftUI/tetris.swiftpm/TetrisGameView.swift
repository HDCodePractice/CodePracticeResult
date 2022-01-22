//
//  TetrisGameView.swift
//  tetris
//
//  Created by Jaden Cheung on 1/12/22.
//

import SwiftUI

class TetrisGameViewModel: ObservableObject {
    @Published var gameBoard: [[TetrisBoardSquare]]
    var numRows: Int
    var numColumns: Int
    
    init(numRows: Int = 23, numColumns: Int = 10) {
        self.numRows = numRows
        self.numColumns = numColumns
        
        gameBoard = Array(repeating: Array(repeating: TetrisBoardSquare(color: Color.tetrisBlack), count: numRows), count: numColumns)
    }
}

struct TetrisBoardSquare {
    var color: Color
}

extension Color {
    public static let tetrisBlack = Color(red: 0/255, green: 0/255, blue: 0/255)
}
struct TetrisGameView: View {
    @ObservedObject var tetrisGameViewModel = TetrisGameViewModel()
    
    var body: some View {
        TetrisGameBoardView(tetrisGameViewModel: tetrisGameViewModel)
    }
}

struct TetrisGameBoardView: View {
    @ObservedObject var tetrisGameViewModel: TetrisGameViewModel
    
    var body: some View {
        GeometryReader { (geometry: GeometryProxy) in
            return self.createBoard(boundingRect: geometry.size)
        }
    }
    
    func createBoard(boundingRect: CGSize) -> some View {
        let columns = tetrisGameViewModel.numColumns
        let rows = tetrisGameViewModel.numRows
        let blockSize = min(boundingRect.width / CGFloat(columns), boundingRect.height / CGFloat(rows))
        let xoffset = (boundingRect.width - blockSize * CGFloat(columns)) / 2
        let yoffset = (boundingRect.height - blockSize * CGFloat(rows)) / 2
        
        return ForEach(0...columns-1, id: \.self) { (column:Int) in
            ForEach(0...rows-1, id: \.self) { (row:Int) in
                Path { path in
                    let x = CGFloat(column) * blockSize + xoffset
                    let y = boundingRect.height - (CGFloat(row+1) * blockSize + yoffset)
                    path.addRect(CGRect(x: x, y: y, width: blockSize, height: blockSize))
                }
                .fill(self.tetrisGameViewModel.gameBoard[column][row].color)
            }
        }
    }
}
