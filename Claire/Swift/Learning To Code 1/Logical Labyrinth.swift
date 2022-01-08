for i in 1 ... 8 {
    moveForward()
    if !isBlockedLeft {
        toggleSwitch()
        turnLeft()
    } else if isOnClosedSwitch && isOnGem {
        toggleSwitch()
        collectGem()
        turnRight()
        moveForward()
        moveForward()
        collectGem()
        turnRight()
        turnRight()
        moveForward()
        moveForward()
        turnRight()        
    } else if isOnGem {
        collectGem()       
    } 
}
