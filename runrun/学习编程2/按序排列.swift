characters = [
Character(name: .blu),
portal(color: pink),
Character(name: .hopper),
Gem()
]
characters.remove(at: 1)
characters.remove(at: 2)
characters.insert(Expert(), at: 1)
var rowPlacement = 0
for character in characters {
    world.place(character, at: Coordinate(column: 1, row: rowPlacement))
    rowPlacement += 1
}
