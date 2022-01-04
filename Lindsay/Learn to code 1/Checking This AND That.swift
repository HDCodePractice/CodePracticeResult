for i in 1 ... 7 {
    moveForward()
    if isBlockedLeft && isOnGem {
        turnRight()
        moveForward()
        moveForward()
        toggleSwitch()
        turnLeft()
        turnLeft()
        moveForward()
        moveForward()
        turnRight()
    }
    collectGem()
    
    
    
    
    }
