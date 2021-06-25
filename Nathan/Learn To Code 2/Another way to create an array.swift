let allCoordinates = world.allPossibleCoordinates
for coordinate in allCoordinates {
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
let characters = world.existingCharacters(at: allCoordinates)
for char in characters {
    char.danceLikeNoOneIsWatching()
}
