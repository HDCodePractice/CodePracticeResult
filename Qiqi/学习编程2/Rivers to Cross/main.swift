let expert = Expert()
world.place(expert, facing: south, atColumn: 1, row: 8)
func collectAndMoveForward() { 
    expert.collectGem()
    expert.moveForward()
}
for i in 1 ... 3 {
    collectAndMoveForward()
}
expert.turnLockDown()
expert.turnLeft()
collectAndMoveForward()
expert.move(distance: 2)
collectAndMoveForward()
expert.turnLockUp()
expert.turnRight()
collectAndMoveForward()
collectAndMoveForward()
expert.moveForward()
collectAndMoveForward()
collectAndMoveForward()
