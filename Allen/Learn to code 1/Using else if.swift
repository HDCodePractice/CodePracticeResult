for i in 1 ... 3 {
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
