let allCoordinates = world.allPossibleCoordinates
var heights: [Int] = []
    heights.append(1)
    heights.append(14)
    heights.append(7)
    heights.append(16)
    heights.append(12)
    
// Append random numbers to heights.

var index = 0
for coordinate in allCoordinates {
    if index == heights.count {
        index = 0
    }
    
    // currentHeight stores the height at the current index.
    var currentHeight = heights[index]
    

    if currentHeight == 0 {
        // Do something interesting if currentHeight is equal to 0.
        world.place(Block(), at: coordinate)


    } else {
        for i in 1...currentHeight {
            world.place(Block(), at: coordinate)
        }
        if currentHeight > 10 {
            // Do something different, such as placing a character.
            world.place(Character(), facing: north, at: coordinate)
        } else if coordinate.column >= 3 && coordinate.column < 6 {
            // Do something different, such as placing water.
            world.removeAllBlocks(at: coordinate)
            world.place(Water(),at: coordinate)
            
        }
        // Add more rules to customize your world.

        
    }
    index += 1
    
}
