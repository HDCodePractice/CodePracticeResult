let expert = Expert()
func move() {
    expert.moveForward()
    expert.moveForward()
    expert.moveForward()
}
for i in 1 ... 4 {
    move()
    if i==1 {
        expert.turnLockUp()
    }else{
        expert.collectGem()
    }
    expert.turnLeft()
    expert.turnLeft()
    move()
    expert.turnLeft()
}
