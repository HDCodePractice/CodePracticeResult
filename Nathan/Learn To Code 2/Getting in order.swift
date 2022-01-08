characters = [
  Character(name: .blu)
  Portal(color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1),
  Character(name: . hopper)
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
