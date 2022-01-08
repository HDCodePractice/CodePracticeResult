let expert = Expert()
let expert2 = Expert()
world.place(expert2, atColumn: 0, row: 0)
world.place(expert,atColumn: 0, row: 4)
expert.turnLeft()
expert.turnLeft()
expert2.collectGem()
expert2.turnLeft()
expert2.move(distance: 4)
expert .turnLockDown()
expert2.move(distance: 2)
expert2.turnLock(up: false, numberOfTimes: 2)
expert2.turnLeft()
expert2.turnLeft()
expert2.move(distance: 3)
expert2.turnRight()
expert2.turnLock(up: true, numberOfTimes: 2)
expert.turnRight()
for i in 1 ... 7 {
    if expert.isOnGem {
        expert.collectGem()
        expert.moveForward()
    }else{
        expert.moveForward()
    }
}
