let expert = Expert()
func speed() {
    expert.moveForward()
    expert.moveForward()
}
func gem() {
    speed()
    expert.collectGem()
    expert.turnLockDown()
    expert.turnLeft()
    expert.turnLeft()
    speed()
    expert.turnRight()
}
for i in 1 ... 3 {
    gem()
}
speed()
expert.moveForward()
expert.turnRight()
gem()
gem()
gem()
