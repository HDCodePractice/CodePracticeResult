var heights: [Int] = [2,3,5,7,11,4,9]
let allCoordinates = world.allPossibleCoordinates
var index = 0
for coordinate in allCoordinates {
    if index == heights.count {
        index = 0
    }
    for i in 0...heights[index] {
        world.place(Block(), at: coordinate)
    }
    index += 1
}
