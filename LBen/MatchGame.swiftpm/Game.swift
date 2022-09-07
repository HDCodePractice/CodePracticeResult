
struct Game {
    var board : [[Grid]] = []
    let picPool = ["tshirt","eyes","eyebrow", "nose","mouth", "lungs","ear","brain", "mustache","person","eye","tshirt","eyes","eyebrow", "nose","mouth", "lungs","ear","brain", "mustache","person","eye"]
    let width = 4
    let height = 5
    var pair_count = 0
    var first_one = false
    var prev_value : Grid = Grid(pic: .Close, x: 0, y: 0, img: "")
    
    init() {
        startGame()
    }
    mutating func startGame(){
        board = []
        var picPool_copy = picPool
        for i in 0..<height {
            var row : [Grid] = []
            for j in 0..<width {
                let imageIdx = Int.random(in: 0..<picPool_copy.count)
                
                row.append(Grid(pic: Pic.Close,x: i, y: j, img: picPool_copy[imageIdx]))
                picPool_copy.remove(at: imageIdx)
            }
            board.append(row)
        }
    }
    mutating func openPic(firstGrid: Grid) {
        if board[firstGrid.x][firstGrid.y].pic == .Close {
            board[firstGrid.x][firstGrid.y].pic = .Open
            prev_value = firstGrid
            first_one = true
        }
    }

    mutating func comparePair(secondGrid: Grid) {
        if first_one == true && board[secondGrid.x][secondGrid.y].pic == .Close {
            board[secondGrid.x][secondGrid.y].pic = .Open
            if board[secondGrid.x][secondGrid.y].img == prev_value.img {
                board[secondGrid.x][secondGrid.y].pic = .Match
                board[prev_value.x][prev_value.y].pic = .Match
                pair_count += 1
            }
            else {
                resetPair(secondGrid: secondGrid)
            }
            first_one = false
            
        }else {
            openPic(firstGrid: secondGrid)
        }
    }
    
    mutating func resetPair(secondGrid: Grid) {
        
        board[prev_value.x][prev_value.y].pic = .Close
        board[secondGrid.x][secondGrid.y].pic = .Close
    }
    
    func isEnd() -> String {
        if 0 < pair_count && pair_count < 8 {
            return "you still have \(9 - pair_count) piars left!!"
        }
        else if pair_count == 0 {
            return "Let's start!!"
        }
        else {
            return "You found them all! Good job!"
        }
        
    }
    
    
    
}

