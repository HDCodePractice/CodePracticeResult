for i in 1 ... 2 {
    moveForward()
    if isOnClosedSwitch {
        toggleSwitch()
    }else if isOnGem{
        collectGem()
    }
}
