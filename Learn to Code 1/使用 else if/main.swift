moveForward()
for i in 1 ... 2 {
    if isOnClosedSwitch {
        toggleSwitch()
        moveForward()       
    } else if isOnGem {
        collectGem()
        moveForward()
    }
}
