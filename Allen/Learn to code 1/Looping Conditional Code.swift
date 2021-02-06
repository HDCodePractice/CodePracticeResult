for i in 1 ... 13 {
    if isOnClosedSwitch {
        toggleSwitch()
        moveForward()
    }else if isOnGem {
        collectGem()
        moveForward()
    }else {
        moveForward()
    }
}
