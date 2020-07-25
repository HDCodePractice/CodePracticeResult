let expert = Expert()
func solveSide() {
    expert.moveForward()
    expert.moveForward()
    if expert.isOnGem{
        expert.collectGem()
    } 
}
func toTheCenter() {
    expert.turnLeft()
    expert.turnLeft()
    expert.moveForward()
    expert.moveForward()
    expert.turnRight()
}
for i in 1...3{
    solveSide()
    if i == 3{
        expert.turnLockDown()
    }
    toTheCenter()
}
expert.moveForward()
expert.moveForward()
expert.moveForward()
expert.turnRight()
for i in 1...2{
    solveSide()
    toTheCenter()
}
solveSide()
