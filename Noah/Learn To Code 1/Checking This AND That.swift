for i in 1 ... 3 {
    moveForward()
    if isOnGem {
        collectGem()
    }
}

while !isBlocked && !isOnOpenSwitch {
    moveForward()
    if isBlockedLeft {
        turnRight()
        moveForward()
        moveForward()
        toggleSwitch()
        turnRight()
        turnRight()
        moveForward()
        moveForward()
        turnRight()
    }
    if isOnGem {
        collectGem()
    }
}




