let expert = Expert()
var gemCounter = 0
world.place(expert, atColumn: 2, row: 6)
func turnAround() {
    expert.turnRight()
    expert.moveForward()
    expert.collectGem()
    expert.turnLeft()
    expert.turnLeft()
    expert.moveForward()
    expert.turnLockUp()
    expert.turnRight()
    expert.move(distance: 5)
}
turnAround()
turnAround()
expert.moveForward()
expert.collectGem()
