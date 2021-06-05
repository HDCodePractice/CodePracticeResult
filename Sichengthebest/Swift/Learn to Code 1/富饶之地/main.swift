func collectAndToggle() {
    if isOnGem {
        collectGem()
    }
    if isOnClosedSwitch {
        toggleSwitch()
    }
}

for i in 1 ... 3 {
    while !isBlocked {
        moveForward()
        collectAndToggle()
    }
    if  isBlockedLeft {
        turnRight()
        moveForward()
        turnRight()
        
    } else {
        turnLeft()
        moveForward()
        turnLeft()
    }
}
