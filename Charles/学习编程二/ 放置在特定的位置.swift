let expert = Expert()
world.place(expert, facing: south, atColumn: 2, row: 6)
func turnAround() {
    expert.turnLeft()
    expert.turnLeft()
}

func onerow() {
    expert.turnLeft()
    expert.turnLockUp()
    turnAround()
    expert.moveForward()
    expert.collectGem()
    turnAround()
    expert.moveForward()
    expert.turnRight()
}
onerow()
expert.move(distance: 5)
onerow()
expert.move(distance: 6)
expert.collectGem()
