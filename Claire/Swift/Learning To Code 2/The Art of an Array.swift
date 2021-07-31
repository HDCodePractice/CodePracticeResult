let allCoordinates = world.allPossibleCoordinates
let backRow = world.coordinates(inRows: [9])
let insideSquare = world.coordinates(inColumns: [4,5], intersectingRows: [4,5])
let squareCorners = world.coordinates(inColumns: [2,3,6,7], intersectingRows: [3,7])
let squareLock = PlatformLock(color: #colorLiteral(red: 0.0, green: 0.9768045545, blue: 0.0, alpha: 1.0))
world.place(squareLock, at: Coordinate(column: 1, row: 1))
let cornerLock = PlatformLock(color: .pink)
world.place(cornerLock, at: Coordinate(column: 8, row: 1))
let backLock = PlatformLock(color: .blue)
world.place(backLock, at: Coordinate(column: 4, row: 1))

for coor in insideSquare {
    world.place(Platform(onLevel: 3, controlledBy: squareLock), at: coor)
    world.place(Character(name: .hopper), at: coor)
}
for coor in squareCorners {
    world.place(Platform(onLevel: 2, controlledBy: backLock), at: Coordinate(column: coor.column, row: coor.row + 1))
}
let bytes = world.existingCharacters(at: backRow)
let hoppers = world.existingCharacters(at: insideSquare)
let blus = world.existingCharacters(at: squareCorners)
squareLock.movePlatforms(up: true, numberOfTimes: 2)
for hopper in hoppers {
    hopper.turnUp()
}
cornerLock.movePlatforms(up: true, numberOfTimes: 3)
for blu in blus {
    blu.breakItDown()
}
for byte in bytes {
    byte.jump()
}
backLock.movePlatforms(up: true, numberOfTimes: 3)
for byte in bytes {
    byte.turnLeft()
    byte.turnLeft()
    byte.argh()
    byte.collectGem()
}
