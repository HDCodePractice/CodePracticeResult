for i in 1 ... 9 {
    moveForward()
    if isBlocked {
        turnRight()
    }
    if isOnGem {
        collectGem()
    }else if isOnClosedSwitch {
        toggleSwitch()
}
}
