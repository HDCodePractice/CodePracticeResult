let allCoordinates = world.allPossibleCoordinates
var heights: [Int] = []
    for i in 1 ... 12 {
        let random = randomInt(from: 0, to: 15)
        heights.append(random)
    }
    var index = 0
for coordinate in allCoordinates {
    if index == heights.count {
        index = 0
    }
    var currentHeight = heights[index]
    if currentHeight == 0 {
        world.place(Block(), at: coordinate)
    } else {
        for i in 1...currentHeight {
            world.place(Block(), at: coordinate)
        }
        if currentHeight > 10 {
            world.place(Expert(), at: coordinate)
        } else if coordinate.column >= 3 && coordinate.column < 6 {
            world.removeItems(at: coordinate)
            world.place(Water(), at: coordinate)
        }
        if coordinate.column == 7 {
            world.place(Character(), at: coordinate)
        }
    }
    index += 1
}
