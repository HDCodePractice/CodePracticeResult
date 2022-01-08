let yellowexpert = Expert()
world.place(yellowexpert, facing: north, atColumn: 3, row: 0)
let purpleblueexpert = Expert()
world.place(purpleblueexpert, facing: north, atColumn: 0, row: 4)
yellowexpert.turnLock(up: true, numberOfTimes: 2)
yellowexpert.turnLeft()
yellowexpert.move(distance: 3)
yellowexpert.collectGem()
yellowexpert.turnLeft()
yellowexpert.turnLeft()
yellowexpert.move(distance: 4)
purpleblueexpert.turnLockDown()
yellowexpert.move(distance: 2)
yellowexpert.turnLock(up: false, numberOfTimes: 2)
purpleblueexpert.turnRight()
while !purpleblueexpert.isBlocked {
    if purpleblueexpert.isOnGem {
        purpleblueexpert.collectGem()
    }else{
        purpleblueexpert.moveForward()
    }
}
