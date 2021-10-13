let allCoordinates = world.allPossibleCoordinates

for coordinate in allCoordinates {
    // Change height to be the sum of the column and row for each coordinate.
    let height = coordinate.column + coordinate.row
    
    for i in 0...height {
        world.place(Block(), at: coordinate)
    }
    
    if height >= 8 && height < 10 {
        world.place(Character(name: .blu), at: coordinate)
    } else if height > 9 {
        world.place(Character(name: .byte), at: coordinate)
    }
}

// Initialize an array of existing characters in the puzzle world.
let characters = world.existingCharacters(at: allCoordinates)

// For each of the characters, perform a set of actions.
for char in characters {
    char.danceLikeNoOneIsWatching()
    char.turnUp()
    char.breakItDown()
    char.grumbleGrumble()
    char.argh()
}
