let expert = Expert()
func move() {
    expert.moveForward()
    expert.moveForward()
}
func moveRight() {
    move()
    expert.turnRight()
}
func go() {
    move()
    expert.collectGem()
    turnLeft()
    moveRight()
    move()
    turnLeft()
    expert.collectGem()
    moveRight()
    move()
    expert.collectGem()
    expert.turnLockDown()
}
func turnLeft() {
    expert.turnLeft()
    expert.turnLeft()
}
go()
turnLeft()
moveRight()
move()
expert.moveForward()
expert.turnRight()
go()
