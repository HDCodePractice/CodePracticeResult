let allCoordinates = world.allPossibleCoordinates
let backRow = world.coordinates(inRows: [9])
let insideSquare = world.coordinates(inColumns: [4,5], intersectingRows: [4,5])
let squareCorners = world.coordinates(inColumns: [2,3,6,7], intersectingRows: [3,7])
let squareLock = PlatformLock(color: .green)
world.place(squareLock, at: Coordinate(column: 1, row: 1))
let cornerLock = PlatformLock(color: .pink)
world.place(cornerLock, at: Coordinate(column: 8, row: 1))
let backLock = PlatformLock(color: .blue)
world.place(backLock, at: Coordinate(column: 4, row: 1))
for coor in insideSquare {
    world.place(Platform(onLevel: 4, controlledBy: squareLock), at: coor)
    world.place(Character(name: .hopper), at: coor)
}
for coor in squareCorners {
    world.place(Platform(onLevel: 4, controlledBy: cornerLock), at: coor)
    world.place(Expert(), at: coor)
}
for coor in backRow {
    world.place(Platform(onLevel: 3, controlledBy: backLock), at: Coordinate(column: coor.column, row: coor.row))
    world.place(Character(name: .blu), facing: north, at: coor)
}
let blus = world.existingCharacters(at: backRow)
let hoppers = world.existingCharacters(at: insideSquare)
let experts = world.existingExperts(at: squareCorners)
squareLock.movePlatforms(up: true, numberOfTimes: 5)
for hopper in hoppers {
    hopper.breakItDown()
}
cornerLock.movePlatforms(up: true, numberOfTimes: 7)
for expert in experts {
    expert.grumbleGrumble()
}
backLock.movePlatforms(up: true, numberOfTimes: 11)
for blu in blus {
    blu.turnLeft()
    blu.turnLeft()
    blu.argh()
}
