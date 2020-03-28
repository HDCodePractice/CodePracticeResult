    let allCoordinates = world.allPossibleCoordinates
    var heights: [Int] = []
    let island = randomInt(from: 1, to: 6)
    heights.append(island)
    var index = 0
    for coordinate in allCoordinates {
        if index == heights.count {
            index = 0
        }
        var currentHeight = heights[0]
        for i in 1 ... randomInt(from: 1, to: 12) {
            world.place(Block(), at: coordinate)
        }
        if coordinate.column < 5 {
            world.place(Character(name: .blu), at: coordinate)
        } else if coordinate.column >=  5 && coordinate.column < 7 {
            world.removeAllBlocks(at: coordinate)
            world.place(Water(), at: coordinate)
        }
    }
        
   
