let allCoordinates = world.allPossibleCoordinates
for coordinate in allCoordinates {
    let height = coordinate.column
    
    for i in 0...height {
        world.place(Block(), at: coordinate)
    }
    if height >= 2 && height < 4 {
        world.place(Character(name: .blu), at: coordinate)
    } else if height > 3 {
        world.place(Character(name: .hopper), at: coordinate)
    } else if height < 3 {
        world.place(Character(name: .byte), at: coordinate)
    }
}
let characters = world.existingCharacters(at: allCoordinates)
for character in characters {
    character.danceLikeNoOneIsWatching()
    character.turnUp()
    character.breakItDown()
}
