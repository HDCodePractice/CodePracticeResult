let allCoordinates = world.allPossibleCoordinates
var heights: [Int] = [0,3,0,0,7,13,11,0,1,0]

// Append random numbers to heights.
    
    
    let minecraft = randomInt(from: 0, to: 5)
    var index = 0
for coordinate in allCoordinates {
    if index == heights.count {
        index = 0
    }
    
    // currentHeight stores the height at the current index.
    var currentHeight = heights[index]
    if currentHeight == 0 {
        // Do something interesting if currentHeight is equal to 0.
        world.removeAllBlocks(at: coordinate)
        world.place(Water(), at: coordinate)

    } else {
        for i in 1...currentHeight {
            world.place(Block(), at: coordinate)
        }
        if currentHeight > 10 {
            // Do something different, such as placing a character.
            
        } else if coordinate.column >= 3 && coordinate.column < 6 {
            // Do something different, such as placing water.
            world.place(PlatformLock(), at: coordinate)
        }
        // Add more rules to customize your world.
        world.place(Gem(), at: coordinate)
        world.place(Switch(), at: coordinate)
        world.place(Expert(), at: coordinate)
        world.place(Character(), at: coordinate)
        world.place(Platform(), at: coordinate)
    }
    index += 1
}
    
    
