let expert = Expert()
world.place(expert, facing: south, atColumn: 1, row: 8)
    expert.collectGem()
    while !expert.isBlocked {
        expert.moveForward()
        if expert.isOnGem {
            expert.collectGem()
        }
        if expert.isBlocked&&expert.isBlockedLeft {
            expert.turnLockUp()
            expert.turnRight()
        }else if expert.isBlocked&&expert.isBlockedRight {
            expert.turnLock(up: false, numberOfTimes: 1)
            expert.turnLeft()
    }
}
