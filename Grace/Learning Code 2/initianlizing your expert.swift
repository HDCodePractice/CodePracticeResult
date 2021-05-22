func solveOneSide() {
    expert.moveForward()
    expert.moveForward()
    expert.moveForward()
    if expert.isOnGem {
        expert.collectGem()
    }else {
        expert.turnLockUp()
    }
}
for i in 1 ... 3 {
    solveOneSide()
    expert.turnLeft()
    expert.turnLeft()
    expert.moveForward()
    expert.moveForward()
    expert.moveForward()
    expert.turnRight()
}
solveOneSide()
