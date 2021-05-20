for i in 1...4{
    expert.turnLeft()
    expert.moveForward()
    expert.moveForward()
    expert.moveForward()
    if expert.isOnGem{
        expert.collectGem()
    } else{
        expert.turnLockUp()
    }
    expert.turnLeft()
    expert.turnLeft()
    expert.moveForward()
    expert.moveForward()
    expert.moveForward()
}
