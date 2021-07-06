moveForward()
for i in 1 ... 5 {
    if isOnGem {
        collectGem()
        turnRight()
        moveForward()
        moveForward()
        moveForward()
        turnLeft()
        moveForward()
        collectGem()
        turnRight()
        turnRight()
        moveForward()
        turnRight()
        moveForward()
        moveForward()
        moveForward()
        turnRight()
    }
    else if isOnClosedSwitch {
        toggleSwitch()
        turnLeft()
        moveForward()
        collectGem()
        turnRight()
        turnRight()
        moveForward()
        turnLeft()
    }
    moveForward()
}
