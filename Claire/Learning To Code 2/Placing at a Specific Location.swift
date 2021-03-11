let expert = Expert()
world.place(expert, atColumn: 2, row: 6)
func collectAndLock() {
    expert.turnRight()
    expert.moveForward()
    expert.collectGem()
    expert.turnLeft()
    expert.turnLeft()
    expert.moveForward()
    expert.turnLockUp()
    expert.turnRight()
}
func turnAround() {
    collectAndLock()
    expert.move(distance: 5)
}
turnAround()
turnAround()
expert.moveForward()
expert.collectGem()
