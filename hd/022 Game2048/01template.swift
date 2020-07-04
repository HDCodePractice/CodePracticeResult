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
        appear()
    }
    
    func left() {
        appear()
    }
    
    func down() {
        appear()
    }
    
    func right() {
        appear()
    }
    
    func appear()-> Bool {
        var emptyGrid = [[Int]] ()
        for i in 0 ... self.grid - 1 {
            for j in 0 ... self.grid - 1 {
                if self.gray[i][j] == 0 {
                    emptyGrid.append([i,j])
                }
            }
        }
        if emptyGrid.isEmpty {  // 没有空格
            return false
        }else{
            let r = emptyGrid.randomElement()!
            self.gray[r[0]][r[1]] = [2,4].randomElement()!
            return true
        }
    }
}


func playGame() {
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
}

func testGame() {
    let myGame = Game2048(grid: 4)
    show("向上合并测试")
    let testUpOrig = [
        [0,2,4,2],
        [0,2,0,2],
        [0,2,4,2],
        [2,2,0,0]
    ]
    let testUpDest = [
        [2,4,8,4],
        [0,4,0,2],
        [0,0,0,0],
        [0,0,0,0]
    ]
    myGame.gray = testUpOrig
    myGame.showGrid()
    myGame.up()
    myGame.showGrid()
    if myGame.gray == testUpDest {
        show("向上合并成功了！")
    }else{
        show("向上合并错误了！应该是")
        myGame.gray = testUpDest
        myGame.showGrid()
    }
    
    show("向下合并测试")
    let testDownOrig = [
        [0,2,4,2],
        [0,2,0,2],
        [0,2,4,2],
        [2,2,0,0]
    ]
    let testDownDest = [        
        [0,0,0,0], 
        [0,0,0,0],  
        [0,4,0,2],
        [2,4,8,4]
    ]
    myGame.gray = testUpOrig
    myGame.showGrid()
    myGame.down()
    myGame.showGrid()
    if myGame.gray == testDownDest {
        show("向下合并成功了！")
    }else{
        show("向下合并错误了！应该是")
        myGame.gray = testDownDest
        myGame.showGrid()
    }
    
    show("向左合并测试")
    let testLeftOrig = [
        [0,0,0,2],
        [2,2,2,2],
        [4,0,4,0],
        [2,2,2,0]
    ]
    let testLeftDest = [        
        [2,0,0,0], 
        [4,4,0,0],  
        [8,0,0,0],
        [4,2,0,0]
    ]
    myGame.gray = testLeftOrig
    myGame.showGrid()
    myGame.left()
    myGame.showGrid()
    if myGame.gray == testLeftDest {
        show("向左合并成功了！")
    }else{
        show("向左合并错误了！应该是")
        myGame.gray = testLeftDest
        myGame.showGrid()
    }
    
    show("向右合并测试")
    let testRightOrig = [
        [0,0,0,2],
        [2,2,2,2],
        [0,4,0,4],
        [0,2,2,2]
    ]
    let testRightDest = [        
        [0,0,0,2], 
        [0,0,0,8],  
        [0,0,0,8],
        [0,0,2,4]
    ]
    myGame.gray = testRightOrig
    myGame.showGrid()
    myGame.right()
    myGame.showGrid()
    if myGame.gray == testRightDest {
        show("向左合并成功了！")
    }else{
        show("向左合并错误了！应该是")
        myGame.gray = testRightDest
        myGame.showGrid()
    }
}

testGame()
