import SwiftUI

struct ViewModel {
    let bank: [String] = ["HELLO","WORLD","aB","bB","cB","dB","eB","fB"]
    var words: [Word] = []
    var grid: [[GridItem]] = []
    var lines: [Line] = []
    var tempLine: Line = Line(start: [0,0], end: [0,0], color: .white)
    var gameMode: GameMode = .easy
    var gameStatus: GameStatus = .start
    init() {
        setUp()
    }
    
    mutating func wordsList() -> String {
        var tempVar = ""
        for eachWord in words {
            tempVar += (eachWord.title + " ")
        }
        return tempVar
    }
    
    mutating func setUp() {
        let gridSize = 7
        for _ in 0 ... gridSize {
            words.append(Word(title: bank.randomElement() ?? "NULL", isFound: false))
        }
        for eachWord in words {
            let randomLocation = Int.random(in: 1...gridSize*gridSize)
            let row = Int(randomLocation / gridSize)
            let col = Int(randomLocation % gridSize)
            var chosenDirection: Int {
                col == 0 && row == 0 ? Int.random(in: 3...5) :
                col == 0 && row == gridSize ? Int.random(in: 1...3) :
                col == gridSize && row == 0 ? Int.random(in: 5...7) :
                col == gridSize && row == gridSize ? [7,8,1].randomElement()! :
                col == 0 ? Int.random(in: 1...5) :
                col == gridSize ? [5,6,7,8,1].randomElement()! :
                row == 0 ? Int.random(in: 3...7) :
                row == gridSize ? [7,8,1,2,3].randomElement()! :
                Int.random(in: 1...8)
            }
            var allRows: [[GridItem]] = []
            for _ in 0 ... gridSize {
                var eachRow: [GridItem] = []
                for _ in 0 ... gridSize {
                    eachRow.append(GridItem(text: "", occupied: false))
                }
                allRows.append(eachRow)
                eachRow = []
            }
            grid = allRows
            for r in 0 ... gridSize {
                for c in 0 ... gridSize {
                    if r == row && c == col {
                        grid[r][c].text = String(eachWord.title.prefix(1))
                    }
                }
            }
        }
    }
}

struct Line: Identifiable {
    let id = UUID()
    var start: [Int]
    var end: [Int]
    var color: Color
}

struct GridItem: Identifiable, Hashable {
    let id = UUID()
    var text: String
    var occupied: Bool
}

struct Word: Identifiable, Hashable {
    let id = UUID()
    var title: String
    var isFound: Bool
}

enum GameStatus {
    case start
    case inprogress
    case end
}

enum GameMode {
    case easy
    case medium
    case hard
}
