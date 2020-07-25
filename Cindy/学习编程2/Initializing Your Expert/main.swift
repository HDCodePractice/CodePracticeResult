let expert = Expert()
func solveSide() {
    expert.moveForward()
    expert.moveForward()
    expert.moveForward()
    if expert.isOnGem{
        expert.collectGem()
    } else{
        expert.turnLockUp()
    }
}
func toTheCenter() {
    expert.turnLeft()
    expert.turnLeft()
    expert.moveForward()
    expert.moveForward()
    expert.moveForward()
    expert.turnRight()
}
for i in 1...3{
    solveSide()
    toTheCenter()
}
solveSide()
