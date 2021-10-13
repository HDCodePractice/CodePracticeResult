let allTheCoordinates = world.allPossibleCoordinates
    var heights: [Int] = []
    let stuff = randomInt(from: 0, to: 7)
    heights.append(stuff)
    var index = 0
    for coordinate in allTheCoordinates {
        if index == heights.count {
            index = 0
        }
        var currentHeight = heights[0]
        for i in 1 ... randomInt(from: 1, to: 7) {
            world.place(Block(), at: coordinate)
        }
        if coordinate.column<3 || coordinate.column>4{
            world.place(Character(), at: coordinate)
        }else if coordinate.column >= 3 || (4 != 0){
            world.removeAllBlocks(at: coordinate)
            world.place(Water(), at: coordinate)
        }
    }    
