let expert = Expert()
expert.turnLeft()
expert.turnLeft()
func solveSide() {
    expert.moveForward()
    expert.moveForward()
    if expert.isOnGem{
        expert.collectGem()
    } else{
        expert.turnLockDown()
    }
}
func toTheCenter() {
    expert.turnLeft()
    expert.turnLeft()
    expert.moveForward()
    expert.moveForward()
}
for i in 1...3{
    solveSide()
    toTheCenter()
}
expert.turnLeft()
solveSide()
toTheCenter()
expert.moveForward()
expert.moveForward()
expert.moveForward()
solveSide()
toTheCenter()
expert.turnLeft()
solveSide()
toTheCenter()
solveSide()
