let expert = Expert()
world.place(expert, facing: north, atColumn: 0, row: 0)
expert.collectGem()
world.place(expert, facing: east, atColumn: 6, row: 0)
expert.turnLock(up: false, numberOfTimes: 2)
world.place(expert, facing: north, atColumn: 3, row: 0)
expert.turnLock(up: true, numberOfTimes: 2)
world.place(expert, facing: west, atColumn: 7, row: 4)
for i in 1 ... 7 {
    expert.moveForward()
    expert.collectGem()
}
