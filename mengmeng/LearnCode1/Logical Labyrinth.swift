for i in 1 ... 8 {
    moveForward()
    if isOnGem && isOnClosedSwitch {
        collectGem()
        toggleSwitch()
        turnRight()
        moveForward()
        moveForward()
        collectGem()
        turnRight()
        turnRight()
        moveForward()
        moveForward()
    } else if isOnGem  {
        collectGem()
    } else if isOnClosedSwitch {
        toggleSwitch()
        turnLeft()
    }
    if isBlocked{
        turnRight()
    }
}
    
    
    
    
