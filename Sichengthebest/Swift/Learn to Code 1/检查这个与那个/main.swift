for i in 1 ... 7 {
    moveForward()
    if isOnGem && isBlockedLeft {
        turnRight()
        moveForward()
        moveForward()
        turnRight()
        turnRight()
        toggleSwitch()
        moveForward()
        moveForward()
        turnRight()
    }
    collectGem()   
}
