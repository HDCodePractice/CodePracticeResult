var rowTwo = world.row(2)
var character:[Coordinate] = []
for i in 1...12 {
    for coordinate in rowTwo {
        world.place(Block(), at: coordinate)
    }
    character.append(rowTwo.remove(at: 0))
}
for character in character {
    world.place(Character(), facing: .east, at: character)
}
