for i in 1 ... 7 {
    moveForward()
    if isOnGem && isBlockedLeft {
        turnRight()
        moveForward()
        moveForward()
        toggleSwitch()
        turnLeft()
        turnLeft()
        moveForward()
        moveForward()
        turnRight()
        collectGem() 
    } else if isOnGem {
        collectGem()    
    }    
}
