import SwiftUI

class ViewModel: ObservableObject {
    let buttons: [[String]] = [
        ["Q","W","E","R","T","Y","U","I","O","P"],
        ["A","S","D","F","G","H","J","K","L"],
        ["enter","Z","X","C","V","B","N","M","delete"]] 
    @Published var keyboard: [[ButtonItem]] = []
    
    @Published var word = "DREAM"
    func initKeyboard() {
        for row in buttons {
            var r: [ButtonItem] = []
            for each in row {
                r.append(ButtonItem(letter: each, util: each == "enter" ? .enter : each == "delete" ? .delete : .letter, color: .notUsed))
            }
            keyboard.append(r)
            r = []
        }
    }
    
    @Published var grid: [[GridItem]] = []
    
    func initGrid() {
        for _ in 0 ... 5 {
            var tempArray: [GridItem] = []
            for _ in 0 ... 4 {
                tempArray.append(GridItem(status: .empty, text: ""))
            }
            grid.append(tempArray)
            tempArray = []
        }
    }
    
    init() {
        initKeyboard()
        initGrid()
    }
    
    func checkRow(row: [GridItem]) -> Bool {
        for each in row {
            if each.status != .empty && each.status != .incomplete {
                return true
            }
        }
        return false
    }
    
    func checkTyped(row: [GridItem]) -> Int {
        var count = 0
        for each in row {
            if each.status == .incomplete {
                count += 1
            }
        }
        return count
    }
    
    func checkWord(input: [String]) -> [Color] {
        var output: [Color] = []
        for each in 0 ... input.count-1 {
            if String(Array(word)[each]) == input[each]  {
                output.append(.green)
            } else if word.contains(input[each]) {
                output.append(.yellow)
            } else {
                output.append(.gray)
            }
        }
        return output
    }
    
    func action(row: Int, each: Int, status: GridStatus, color: ButtonColor, input: [String]) {
        grid[row][each].status = status
        for row in 0 ... keyboard.count - 1 {
            for each in 0 ... keyboard[row].count - 1 {
                for e in 0 ... input.count - 1 {
                    if input[e] == keyboard[row][each].letter {
                        switch color {
                        case .right :
                            keyboard[row][each].color = color
                        case .partial: 
                            if keyboard[row][each].color != .right {
                                keyboard[row][each].color = color
                            }
                        case .wrong: 
                            if ![.right,.partial].contains(keyboard[row][each].color) {
                                keyboard[row][each].color = color
                            }
                        default: 
                            keyboard[row][each].color = color
                        }
                    }
                }
            }
        }
    }
    func tapButton(button: ButtonItem) {
        if button.letter == "enter" {
            for row in 0 ... grid.count - 1 {
                if !checkRow(row: grid[row]) {
                    if grid[row][4].status == .incomplete {
                        var input: [String] = []
                        for each in grid[row] {
                            input.append(each.text)
                        }
                        for each in 0 ... checkWord(input: input).count - 1 {
                            switch checkWord(input: input)[each] {
                            case .green: 
                                action(row: row, each: each, status: .right, color: .right, input: input)
                            case .yellow:
                                action(row: row, each: each, status: .partial, color: .partial, input: input)
                            case .gray: 
                                action(row: row, each: each, status: .wrong, color: .wrong, input: input)
                            default:
                                action(row: row, each: each, status: .empty, color: .notUsed, input: input)
                            }
                        }
                    }
                }
            }
        } else if button.letter == "delete" {
            for row in 0 ... grid.count - 1 {
                if !checkRow(row: grid[row]) {
                    if grid[row][4].status != .incomplete {
                        if checkTyped(row: grid[row]) != 0 {
                            grid[row][checkTyped(row: grid[row])-1] = GridItem(status: .empty, text: "")
                        }
                    }
                    return
                }
            }
        } else {
            for row in 0 ... grid.count - 1 {
                if !checkRow(row: grid[row]) {
                    if grid[row][4].status != .incomplete {
                        grid[row][checkTyped(row: grid[row])] = GridItem(status: .incomplete, text: button.letter)
                    }
                    return
                }
            }
        }
        
        
        
        //        
        //        switch button.color {
        //            case .notUsed: 
        //            keyboard[pos[0]][pos[1]].color = .wrong
        //            case .wrong:
        //            keyboard[pos[0]][pos[1]].color = .partial
        //            case .partial:
        //            keyboard[pos[0]][pos[1]].color = .right
        //            case .right: 
        //            keyboard[pos[0]][pos[1]].color = .notUsed
        //        }
    }
}
