characters = [
    Characters(name: .blu),
    Portal(color: pink),
    Character(name: .hopper),
    Gem()
]  
// Remove the portal.
characters.remove(at: 1)
// Remove the gem.
characters.remove(at: 2)
// Insert the expert.
characters.insert(Expert(), at: 1)
var rowPlacement = 0
for character in characters {
    world.place(character, at: Coordinate(column: 1, row: rowPlacement))
    rowPlacement += 1
}
