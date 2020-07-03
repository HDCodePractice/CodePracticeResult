class Game2048 {
    var gray : [[Int]] = []
    var grid : Int = 0
    /**
     初始化一个grid x grid个的数组
     */
    init(grid : Int){
        self.grid = grid
        for i in 1 ... grid {
            var row : [Int] = []
            for j in 1 ... grid {
                row.append(0)
            }
            self.gray.append(row)
        }
    }
    
    /**
     显示出当前的格子
     */
    func showGrid() {
        var s = ""
        for i in self.gray{
            s += "|"
            for j in i {
                s += "\(j)|"
            }
            s += "\n"
        }
        show(String(s.prefix(s.count - 1)))
    }
    
    func up() {
    }
    
    func left() {
        
    }
    
    func down() {
    }
    
    func right() {
    }
    
}

let myGame = Game2048(grid: 4)
while true {
    let input = ask()
    switch input {
    case "w":
        myGame.up()
        myGame.showGrid()
    case "a":
        myGame.left()
        myGame.showGrid()
    case "s":
        myGame.down()
        myGame.showGrid()
    case "d":
        myGame.right()
        myGame.showGrid()
    default: 
        show("只接受 w上 a左 s下 d右 指令")
    }
}

myGame.showGrid()
