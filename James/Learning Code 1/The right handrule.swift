func navigateAroundWall() {
    if isBlockedRight {
        moveForward()
    }  else {
        turnRight()
        moveForward()
    }
}
for i in 1 ... 4 {
    while isBlocked {
        collectGem()
        turnLeft()
        turnLeft()
    }
    while !isOnClosedSwitch && !isOnGem {
        navigateAroundWall()
    }
}
toggleSwitch()
