moveForward()
for i in 1 ... 6 {
    if isOnGem {
        collectGem()
        turnRight()
        moveForward()
        moveForward()
        moveForward()
        turnLeft()
        moveForward()
        collectGem()
        turnLeft()
        turnLeft()
        moveForward()
        turnRight()
        moveForward()
        moveForward()
        moveForward()
        turnRight()
        moveForward()
    }
    if isOnClosedSwitch {
        toggleSwitch()
        turnLeft()
        moveForward()
        collectGem()
        turnLeft()
        turnLeft()
        moveForward()
        turnLeft()
        moveForward()
    }
    if isOnOpenSwitch {
        moveForward()
        
    }
    
}
