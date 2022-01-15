let expert = Expert()
func move3() {
    expert.moveForward()
    expert.moveForward()
    expert.moveForward()
}
move3()
expert.turnLockUp()
expert.turnRight()
expert.turnRight()
move3()
for i in 1 ... 3 {
    expert.turnLeft()
    move3()
    expert.collectGem()
    expert.turnLeft()
    expert.turnLeft()
    move3()
}
