    let allCoordinates = world.allPossibleCoordinates
    var heights: [Int] = []
    let noH = randomInt(from: 1, to: 8)
    heights.append(noH)
    var index = 0
    for coordinate in allCoordinates {
        if index == heights.count {
            index = 0
        }
        var currentHeight = heights[0]
        for i in 1 ... randomInt(from: 1, to: 20) {
            world.place(Block(), at: coordinate)
        }
        if coordinate.column < 5 {
            world.place(Character(name: .byte), at: coordinate)
        } else if coordinate.column >= 3 && coordinate.column < 6 {
            world.removeAllBlocks(at: coordinate)
            world.place(Water(), at: coordinate)
        }
        if currentHeight < 9 {
            world.place(Gem(), at: coordinate)
        }
        for byte in world.existingCharacters(at: allCoordinates) {
            if byte.isOnGem {
                byte.collectGem()
            }
            
        }
        index += 1
    }
