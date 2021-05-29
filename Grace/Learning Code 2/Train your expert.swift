let expert = Expert()
func move() {
    expert.moveForward()
    expert.moveForward()
}
func turnAround(){
    expert.turnLeft()
    expert.turnLeft()
}
for i in 1...3{
    move()
    expert.collectGem()
    expert.turnLockDown()
    turnAround()
    move()
    expert.turnRight()
}
move()
expert.moveForward()
for i in 1...3{
    expert.turnLeft()
    move()
    expert.collectGem()
    turnAround()
    move()
}
