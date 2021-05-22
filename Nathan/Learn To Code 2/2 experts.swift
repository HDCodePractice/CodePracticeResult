let expert = Expert()

let expert2 = Expert()

world.place(expert, facing: north, atColumn: 0, row: 4)

world.place(expert2, facing: east, atColumn: 0, row: 0)

expert2.collectGem()
expert2.move(distance: 3)
expert2.turnLeft()
expert.turnLockDown()
expert.turnRight()
expert2.turnLock(up: true, numberOfTimes: 2)
expert2.turnRight()
expert2.move(distance: 3)
expert2.turnLock(up: false, numberOfTimes: 2)

while !expert.isBlocked {
    if expert.isOnGem {
        expert.collectGem()
    }
    expert.moveForward()
}
