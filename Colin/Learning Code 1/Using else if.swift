moveForward()
for i in 1...2 {
    if isOnGem {
        collectGem()
        moveForward()
    } else if isOnClosedSwitch {
        toggleSwitch()
    }
}
