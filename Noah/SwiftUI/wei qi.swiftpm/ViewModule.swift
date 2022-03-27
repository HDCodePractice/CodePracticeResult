import SwiftUI

struct ViewModule {
    let gridSize = 4
    var chessBoard: [[Cross]] {
        var grid: [[Cross]] = []
        for row in 0 ... gridSize {
            var tempVar: [Cross] = []
            for each in 0 ... gridSize {
                row == 0 && each == 0 ? tempVar.append(Cross(image:"TopLeft")) :
                row == 0 && each == gridSize ? tempVar.append(Cross(image:"TopRight")) :
                row == gridSize && each == 0 ? tempVar.append(Cross(image:"BottomLeft")) :
                row == gridSize && each == gridSize ? tempVar.append(Cross(image:"BottomRight")) :
                row == 0 && each != 0 && each != gridSize ? tempVar.append(Cross(image:"Top")) :
                row == gridSize && each != 0 && each != gridSize ? tempVar.append(Cross(image:"Bottom")) :
                row != 0 && row != gridSize && each == 0 ? tempVar.append(Cross(image:"Left")) :
                row != 0 && row != gridSize && each == gridSize ? tempVar.append(Cross(image:"Right")) :
                Double(row) == Double(gridSize) / 2 && Double(each) == Double(gridSize) / 2 ? tempVar.append(Cross(image:"MidDot")) :
                tempVar.append(Cross(image:"Mid"))
            }
            grid.append(tempVar)
            tempVar = []
        }
        return grid
    }
    var pieces: [[Pieces]] = [[Pieces(status: ""),Pieces(status: ""),Pieces(status: ""),Pieces(status: ""),Pieces(status: "")],[Pieces(status: ""),Pieces(status: ""),Pieces(status: ""),Pieces(status: ""),Pieces(status: "")],[Pieces(status: ""),Pieces(status: ""),Pieces(status: ""),Pieces(status: ""),Pieces(status: "")],[Pieces(status: ""),Pieces(status: ""),Pieces(status: ""),Pieces(status: ""),Pieces(status: "")],[Pieces(status: ""),Pieces(status: ""),Pieces(status: ""),Pieces(status: ""),Pieces(status: "")],]
//    mutating func chess() -> [[Pieces]] {
//        var pieces: [[Pieces]] = []
//        for _ in 0 ... gridSize {
//            var tempVar: [Pieces] = []
//            for _ in 0 ... gridSize {
//                tempVar.append(Pieces(status: ""))
//            }
//            pieces.append(tempVar)
//            tempVar = []
//        }
//        return pieces
//    }
}


struct Cross : Identifiable, Hashable {
    let id: UUID = UUID()
    var image: String
}

struct Pieces : Identifiable, Hashable {
    let id: UUID = UUID()
    var status: String
}
