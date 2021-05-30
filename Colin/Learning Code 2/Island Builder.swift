let allCoordinates = world.allPossibleCoordinates
var landCoordinates: [Coordinate] = []
var seaCoordinates: [Coordinate] = []
for coordinate in allCoordinates {
    if coordinate.column <= 3 || coordinate.row <= 3 || coordinate.column >= 8 || coordinate.row >= 8 {
    seaCoordinates.append(coordinate)
    } else {
    landCoordinates.append(coordinate)
    }
}
for i in landCoordinates {
    world.place(Block(), at: i)
}
