struct Game {
    var board : [[Grid]] = []
    
    let width = 10
    let height = 10
    let shipPoolSize = [2,3,3,4,5]
    var shipPool : [[Int]] = [] 
    init() {
        startGame()
    }
    mutating func startGame(){
        board = []
        shipPool = [] 
        while shipPool.count != shipPoolSize.reduce(0, +) {
            for index in 0..<shipPoolSize.count {
                let direction = Int.random(in: 0...1)
                if direction == 0 {
                    let startPoint = [Int.random(in: 0..<width), Int.random(in: 0..<height)]
                    
                    if startPoint[0] + shipPoolSize[index] > width && !shipPool.contains(startPoint){
                        for i in 0..<shipPoolSize[index] {
                            shipPool.append([startPoint[0] - i, startPoint[1]])
                        }
                        
                    }else {
                        for i in 0..<shipPoolSize[index] {
                            shipPool.append([startPoint[0] + i, startPoint[1]])
                        }
                    }
                } else{
                    let startPoint = [Int.random(in: 0..<width), Int.random(in: 0..<height)]
                    
                    if startPoint[1] + shipPoolSize[index] > height && !shipPool.contains(startPoint) {
                        for i in 0..<shipPoolSize[index] {
                            shipPool.append([startPoint[0], startPoint[1] - i])
                        }
                    }else {
                        for i in 0..<shipPoolSize[index] {
                            shipPool.append([startPoint[0], startPoint[1] + i])
                        }
                    }
                }
                
            }
        }

        for i in 0..<height {
            var row : [Grid] = []
            for j in 0..<width {
                    if shipPool.contains([i,j]) {
                        row.append(Grid(x: i, y: j, background: .blue, opacity: 1, gridStatus: .Deploy))
                    }else {
                        row.append(Grid(x: i, y: j, background: .blue, opacity: 1, gridStatus: .Empty))
                    }
                
            }
            board.append(row)
        }
    }
    
    mutating func changeStatus(grid: Grid) {
            if board[grid.x][grid.y].gridStatus == .Empty {
                board[grid.x][grid.y].opacity = 0
        }else {
            board[grid.x][grid.y].gridStatus = .Destroy
            board[grid.x][grid.y].opacity = 0
        }
        
    }
    
    
    
}
