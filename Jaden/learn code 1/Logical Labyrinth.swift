for i in 1 ... 8 {
    moveForward()
    if isOnGem{
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
        
        
    }
    if isOnClosedSwitch {
        toggleSwitch()
        
    }
    if !isBlockedLeft{
        turnLeft()
        
    }
}
