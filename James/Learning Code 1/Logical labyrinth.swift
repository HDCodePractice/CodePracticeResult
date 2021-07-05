moveForward()
for i in 1 ... 14 {
    if isOnGem && isOnClosedSwitch {
        toggleSwitch()
        collectGem()
        turnRight()
        moveForward()
        moveForward()
        turnLeft()
        collectGem()
        turnLeft()
        moveForward()
        moveForward()
        turnRight()
    } else if isOnOpenSwitch {
        moveForward()
    } else if isOnClosedSwitch {
        turnLeft()
        toggleSwitch()
    } else if !isBlocked {
        moveForward()
    } else if isOnGem {
        collectGem()
    }
    
}
for i in 1 ... 2 {
    turnLeft()
    moveForward()
}
moveForward()
collectGem()




