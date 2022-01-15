moveForward()
if isOnGem {
    collectGem()
    moveForward()
} else if isOnClosedSwitch {
    toggleSwitch()
    moveForward()
}
