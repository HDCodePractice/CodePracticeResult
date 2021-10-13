var coors: [Coordinate] = []
for i in 1 ... 4 {
    for j in 1 ... i + i - 1 {
        coors.append(Coordinate(column: i, row: j + 4 - i))
    }
}
for coordinate in coors {
    for k in 1 ... coordinate.column {
        world.place(Block(), at: coordinate)
    }
    world.place(Character(name: .blu), facing: east, at: coordinate)
}
for i in 1 ... 4 {
    for blu in world.existingCharacters(at:world.allPossibleCoordinates) {
        blu.danceLikeNoOneIsWatching()
        blu.breakItDown()
        blu.turnUp()
        blu.turnLeft()
    }
}
