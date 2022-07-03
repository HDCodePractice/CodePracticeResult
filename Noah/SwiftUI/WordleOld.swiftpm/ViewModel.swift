import SwiftUI

class ViewModel: ObservableObject {
    let keyboard: [[String]] = [
        ["Q","W","E","R","T","Y","U","I","O","P"],
        ["A","S","D","F","G","H","J","K","L"],
        ["enter","Z","X","C","V","B","N","M","delete"]] 
    @Published var fkeyboard: [[ButtonItem]] = []
    init(fkeyboard: [[ButtonItem]] = [], grid: [[GridItem]] = []) {
        for row in keyboard {
            var tempArray: [ButtonItem] = []
            for key in row {
                tempArray.append(ButtonItem(letter: key, cont: .letter, color: .wrong))
            }
            self.fkeyboard.append(tempArray)
            tempArray = []
        }
        initGrid()
    }
    @Published var grid: [[GridItem]] = []
    
    func initGrid() {
        for _ in 0 .xc.. 5 {
            var tempArray: [GridItem] = []
            for _ in 0 ... 4 {
                tempArray.append(GridItem(status: .empty, text: ""))
            }
            grid.append(tempArray)
            tempArray = []
        }
    }
//    func Switch(key: String) {
//        for row in fkeyboard {
//            for k in row {
//                if key == k.letter {
//                    switch k.color {
//                    case .notUsed:
//                        return .gray
//                    case .wrong:
//                        return .yellow
//                    case .partial:
//                        return .green
//                    case .right:
//                        return Color(red: 212/255, green: 214/255, blue: 218/255)
//                    } 
//                }
//                
//            }
//        }
//    }
}
