for i in 1 ... 8 {
    moveForward()
    if isOnGem && isOnClosedSwitch {
        toggleSwitch()
        collectGem()
        turnRight()
        moveForward()
        moveForward()
        collectGem()
        turnLeft()
        turnLeft()
        moveForward()
        moveForward()
        turnRight()
    } else if isOnClosedSwitch {
        toggleSwitch()
        turnLeft()
    } else if isOnGem {
        collectGem()
    }
    }
