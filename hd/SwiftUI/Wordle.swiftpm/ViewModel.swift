import SwiftUI

class ViewModel:ObservableObject{
    enum GameMode{
        case start
        case gameing
        case won
        case lost
    }
    @Published var gameMode : GameMode = .start
    @Published var keyboard : [[KeyboardButton]]=[
        [
            .letter("Q", .empty),
            .letter("W", .empty),
            .letter("E", .empty),
            .letter("R", .empty),
            .letter("T", .empty),
            .letter("Y", .empty),
            .letter("U", .empty),
            .letter("I", .empty),
            .letter("O", .empty),
            .letter("P", .empty)
        ],
        [
            .letter("A", .empty),
            .letter("S", .empty),
            .letter("D", .empty),
            .letter("F", .empty),
            .letter("G", .empty),
            .letter("H", .empty),
            .letter("J", .empty),
            .letter("K", .empty),
            .letter("L", .empty)
        ],
        [
            .function(.enter),
            .letter("Z", .empty),
            .letter("X", .empty),
            .letter("C", .empty),
            .letter("V", .empty),
            .letter("B", .empty),
            .letter("N", .empty),
            .letter("M", .empty),
            .function(.delete)
        ]
    ]
    @Published var grid:[[GridItem]]=[]
    var line = 0
    var colum = 0
    var answer = ["B","R","E","E","D"]
    
    init(){}
    
    func initGrid(){
        grid = []
        for _ in 0..<6{
            var line = [GridItem]()
            for _ in 0..<5{
                line.append(GridItem(letter: " ", status: .empty))
            }
            grid.append(line)
        }
        let answerStr = words.randomElement()!.uppercased()
        answer = []
        for c in answerStr{
            answer.append(String(c))
        }
        print(answer)
    }
    
    func changeKeyboardButtonStatus(letter:String,status: Status){
        for line in 0..<keyboard.count{
            for index in 0..<keyboard[line].count{
                if keyboard[line][index].title == letter{
                    switch status{
                    case .green:
                        keyboard[line][index] = .letter(letter, .green)
                        return
                    case .yellow:
                        if keyboard[line][index] == .letter(letter, .green){
                            return
                        }
                        keyboard[line][index] = .letter(letter, .yellow)
                        return
                    case .gray:
                        keyboard[line][index] = .letter(letter, .gray)
                    default:
                        return
                    }
                }
            }
        }
    }
    
    func checkAnswer()->Bool{
        for i in 0..<grid[line].count{
            if grid[line][i].letter==answer[i]{
                grid[line][i].status = .green
                changeKeyboardButtonStatus(letter: grid[line][i].letter, status: .green)
            }else if answer.contains(grid[line][i].letter){
                grid[line][i].status = .yellow
                changeKeyboardButtonStatus(letter: grid[line][i].letter, status: .yellow)
            }else{
                grid[line][i].status = .gray
                changeKeyboardButtonStatus(letter: grid[line][i].letter, status: .gray)
            }
        }
        for i in grid[line]{
            if i.status != .green{
                return false
            } 
        }
        return true
    }
    
    func tapButton(button: KeyboardButton){
        switch button{
        case .function(let function):
            switch function{
            case .delete:
                if colum>0{
                    grid[line][colum-1].letter = " "
                    grid[line][colum-1].status = .empty
                    colum-=1
                }
            case .enter:
                if line<grid.count && colum==grid[line].count{
                    if checkAnswer() {
                        self.gameMode = .won
                        return
                    }
                    if line == grid.count - 1 {
                        self.gameMode = .lost
                        return
                    }
                    line+=1
                    colum=0
                }
            }
        case .letter(_, _):
            if colum<grid[line].count && line<grid.count{
                grid[line][colum].letter = button.title
                grid[line][colum].status = .input
                colum+=1
            }
        }
    }
}
