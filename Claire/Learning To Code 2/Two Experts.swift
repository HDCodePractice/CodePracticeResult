let expert1 = Expert()
let expert2 = Expert()
world.place(expert1, facing: north, atColumn: 0, row: 4)
world.place(expert2, facing: east, atColumn: 0, row: 0)
expert2.collectGem()
expert2.move(distance: 3)
expert2.turnLeft()
expert2.turnLock(up: true, numberOfTimes: 2)
expert2.turnRight()
expert1.turnLockDown()
expert2.move(distance: 3)
expert2.turnLock(up: false, numberOfTimes: 2)
expert1.turnRight()
while !expert1.isBlocked {
    if expert1.isOnGem {
        expert1.collectGem()
    } else {
        expert1.moveForward()
    }
}
