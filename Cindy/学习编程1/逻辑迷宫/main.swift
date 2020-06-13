for i in 1 ... 8 {
    moveForward()
    if isOnClosedSwitch && isOnGem {
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
    } else if isOnGem  {
        collectGem()
    } else if isOnClosedSwitch {
        toggleSwitch()
        turnLeft()
    }
    
}
