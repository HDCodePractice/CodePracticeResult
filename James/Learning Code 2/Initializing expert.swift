let expert = Expert()
func speed() {
    expert.moveForward()
    expert.moveForward()
    expert.moveForward()
}
speed()
expert.turnLockUp()
expert.turnLeft()
expert.turnLeft()
speed()
for i in 1 ... 3 {
    expert.turnRight()
    speed()
    expert.collectGem()
    expert.turnLeft()
    expert.turnLeft()
    speed()
}
