for i in 1 ... 10 {
    moveForward()
    if isOnOpenSwitch {
        moveForward()
    };turnLeft()
    if isOnClosedSwitch {
        toggleSwitch()
        moveForward()
    }
    if isOnGem {
        collectGem()
        moveForward() 
    }   
}
