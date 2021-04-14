    for i in 1 ... 15 {
        collectOrToggle()
        if isBlocked && isBlockedRight {
            turnLeft()
        }else if isBlocked && isBlockedLeft {
            turnRight()
        }
    }
