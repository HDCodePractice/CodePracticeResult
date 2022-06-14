import SwiftUI


class ViewModel:ObservableObject{
    @Published var keyboard : [[KeyboardButton]]=[
        [
            .letter("Q", .notused),
            .letter("W", .notused),
            .letter("E", .notused),
            .letter("R", .notused),
            .letter("T", .notused),
            .letter("Y", .notused),
            .letter("U", .notused),
            .letter("I", .notused),
            .letter("O", .notused),
            .letter("P", .notused)
        ],
        [
            .letter("A", .notused),
            .letter("S", .notused),
            .letter("D", .notused),
            .letter("F", .notused),
            .letter("G", .notused),
            .letter("H", .notused),
            .letter("J", .notused),
            .letter("K", .notused),
            .letter("L", .notused)
        ],
        [
            .function(.enter),
            .letter("Z", .notused),
            .letter("X", .notused),
            .letter("C", .notused),
            .letter("V", .notused),
            .letter("B", .notused),
            .letter("N", .notused),
            .letter("M", .notused),
            .function(.delete)
        ]
    ]
    @Published var grid:[[GridItem]]=[]
    var line = 0
    var colum = 0
    var answer = ["b","r","e","e","d"]
    
    init(){
        initGrid()
    }
    
    func initGrid(){
        grid = []
        for _ in 0..<6{
            var line = [GridItem]()
            for _ in 0..<5{
                line.append(GridItem(letter: " ", status: .notused))
            }
            grid.append(line)
        }
    }
    
    func tapButton(button: KeyboardButton){
        switch button{
        case .function(let function):
            switch function{
            case .delete:
                if colum>0{
                    grid[line][colum-1].letter = " "
                    colum-=1
                }
            case .enter:
                if line<grid.count && colum==grid[line].count{
                    line+=1
                    colum=0
                }
            }
        case .letter(_, _):
            if colum<grid[line].count && line<grid.count{
                grid[line][colum].letter=button.title
                colum+=1
            }
        }
    }
}
