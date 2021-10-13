while !isOnOpenSwitch {
        moveForward()
        if isOnGem {
            collectGem()
            turnRight()
            moveForward()
            collectGem()
        } else if isOnClosedSwitch {
            toggleSwitch()
            turnLeft()
            moveForward()
            toggleSwitch()
            moveForward()      
        }
        if isBlocked && !isOnGem {
            if isBlocked && !isOnClosedSwitch {
                if isBlockedRight {
                    turnLeft()
                } else {
                    turnRight()
                }
            }
        }
        
    }
