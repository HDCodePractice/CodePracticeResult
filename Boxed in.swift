for i in 1 ... 8 {
    moveForward()
    if isBlocked {
        turnLeft()
    }
    if isOnGem {
        collectGem()
    }
    if isOnClosedSwitch {
        toggleSwitch()
    }
    }
if isOnClosedSwitch {
    toggleSwitch()
}else if isOnGem {
    collectGem()
}
