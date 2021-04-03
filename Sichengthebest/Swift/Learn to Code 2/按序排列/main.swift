characters = [
    Character(name: .blu),
    Portal(color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)),
    Character(name: .hopper),
    Gem()
]
characters.remove(at: 1)
characters.remove(at: 2)
characters.insert(Expert(), at: 1)
characters.insert(Character(name: .byte), at: 2)
var rowPlacement = 0
for character in characters {
    world.place(character, at: Coordinate(column: 1, row: rowPlacement))
    rowPlacement += 1
}
