import SwiftUI

extension String {
    subscript(characterIndex: Int) -> Self {
        return String(self[index(startIndex, offsetBy: characterIndex)])
    }
}

struct ViewModel {
    let bank: [String] = ["HELLO","WORLD","HOPE","FIGHT","PER","EASY","GOT","THIS","GO","MEDIUM","SWIFT","BREAD","APPLE","TECH","FARM","GAME","PENCIL","BOOK","PRINT","TEXT","STRING"]
    let alphabet: [String] = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","W","X","Y","Z"]
    var words: [Word] = []
    var grid: [[GridItem]] = []
    var lines: [Line] = []
    var tempLine: Line = Line(start: [777,777], end: [777,777], color: .white)
    var gameMode: GameMode = .easy
    var gameStatus: GameStatus = .start
    let gridSize = 8
    init() {
        restartgame()
    }
    
    mutating func wordsList() -> String {
        var tempVar = ""
        for eachWord in words {
            tempVar += (eachWord.title + " ")
        }
        return tempVar
    }
    
    mutating func restartgame() {
        words = []
        grid = []
        tempLine = Line(start: [777,777], end: [777,777], color: .white)
        lines = []
        var allRows: [[GridItem]] = []
        for _ in 0 ... gridSize-1 {
            var eachRow: [GridItem] = []
            for _ in 0 ... gridSize-1 {
                eachRow.append(GridItem(text: alphabet.randomElement()!, occupied: true))
            }
            allRows.append(eachRow)
            eachRow = []
        }
        grid = allRows
        setUp()
    }
    mutating func setUp() {
        for _ in 0 ... gridSize-4 {
            words.append(Word(title: bank.randomElement() ?? "NULL", location: [[777,777],[777,777]], isFound: false))
        }
        for eachWord in words {
            let randomLocation = [0,1,2,3,4,5,6,7,8,15,16,23,24,31,32,39,40,47,48,55,56,57,58,59,60,61,62,63].randomElement()!
            let row = randomLocation/gridSize
            let col = randomLocation % gridSize
            var chosenDirection: Int {
                return col == 0 && row == 0 ? Int.random(in: 3...5) :
                    col == 0 && row == gridSize-1 ? Int.random(in: 1...3) :
                    col == gridSize-1 && row == 0 ? Int.random(in: 5...7) :
                    col == gridSize-1 && row == gridSize-1 ? [7,8,1].randomElement()! :
                    col == 0 ? 3 :
                    col == gridSize-1 ? 7 :
                    row == 0 ? 5 :
                    row == gridSize-1 ? 1 :
                    3
            }
            for eachRow in 0 ... gridSize-1 {
                for each in 0 ... gridSize-1 {
                    if eachRow * gridSize + each == randomLocation {
                        if chosenDirection == 1 {
                            for chr in 0 ... eachWord.title.count-1 {
                                grid[eachRow-chr][each].text = eachWord.title[chr]
                                grid[eachRow-chr][each].occupied = true
                                if chr == eachWord.title.count-1 {
                                    words[words.firstIndex(of: eachWord) ?? 0].location = [[col+1,row],[col+1,row-chr]]
                                }
                            }
                            grid[eachRow][each].text = eachWord.title[0]
                        } else if chosenDirection == 2 {
                            for chr in 0 ... eachWord.title.count-1 {
                                grid[eachRow-chr][each+chr].text = eachWord.title[chr]
                                grid[eachRow-chr][each+chr].occupied = true
                                if chr == eachWord.title.count-1 {
                                    words[words.firstIndex(of: eachWord) ?? 0].location = [[col+1,row],[col+chr+1,row-chr]]
                                }
                            }
                        } else if chosenDirection == 3 {
                            for chr in 0 ... eachWord.title.count-1 {
                                grid[eachRow][each+chr].text = eachWord.title[chr]
                                grid[eachRow][each+chr].occupied = true
                                if chr == eachWord.title.count-1 {
                                    words[words.firstIndex(of: eachWord) ?? 0].location = [[col+1,row],[col+chr+1,row]]
                                }
                            }
                        } else if chosenDirection == 4 {
                            for chr in 0 ... eachWord.title.count-1 {
                                grid[eachRow+chr][each+chr].text = eachWord.title[chr]
                                grid[eachRow+chr][each+chr].occupied = true
                                if chr == eachWord.title.count-1 {
                                    words[words.firstIndex(of: eachWord) ?? 0].location = [[col+1,row],[col+chr+1,row+chr]]
                                }
                            }
                        } else if chosenDirection == 5 {
                            for chr in 0 ... eachWord.title.count-1 {
                                grid[eachRow+chr][each].text = eachWord.title[chr]
                                grid[eachRow+chr][each].occupied = true
                                if chr == eachWord.title.count-1 {
                                    words[words.firstIndex(of: eachWord) ?? 0].location = [[col+1,row],[col+1,row+chr]]
                                }
                            }
                        } else if chosenDirection == 6 {
                            for chr in 0 ... eachWord.title.count-1 {
                                grid[eachRow+chr][each-chr].text = eachWord.title[chr]
                                grid[eachRow+chr][each-chr].occupied = true
                                if chr == eachWord.title.count-1 {
                                    words[words.firstIndex(of: eachWord) ?? 0].location = [[col+1,row],[col-chr+1,row+chr]]
                                }
                            }
                        } else if chosenDirection == 7 {
                            for chr in 0 ... eachWord.title.count-1 {
                                grid[eachRow][each-chr].text = eachWord.title[chr]
                                grid[eachRow][each-chr].occupied = true
                                if chr == eachWord.title.count-1 {
                                    words[words.firstIndex(of: eachWord) ?? 0].location = [[col+1,row],[col-chr+1,row]]
                                }
                            }
                        } else if chosenDirection == 8 {
                            for chr in 0 ... eachWord.title.count-1 {
                                grid[eachRow-chr][each-chr].text = eachWord.title[chr]
                                grid[eachRow-chr][each-chr].occupied = true
                                if chr == eachWord.title.count-1 {
                                    words[words.firstIndex(of: eachWord) ?? 0].location = [[col+1,row],[col-chr+1,row-chr]]
                                }
                            }
                        }
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
    var location: [[Int]]
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
