var switchcount = 0
while switchcount < 6 {
    if isOnClosedSwitch {
        toggleSwitch()
        switchcount += 1
    }
    if isBlocked && isBlockedRight {
        turnLeft()
    }else if isBlockedRight {
        moveForward()
    }else {
        turnRight()
        moveForward()
    }
}
