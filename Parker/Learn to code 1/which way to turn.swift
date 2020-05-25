func navAround() {
    if isBlocked {
        turnLeft()
    } else if isBlockedRight {
        moveForward()
    } else {
        turnRight()
        moveForward()
    }
    if isOnClosedSwitch {
        toggleSwitch()
    }
}
while !isOnGem {
    navAround()
}
collectGem()
