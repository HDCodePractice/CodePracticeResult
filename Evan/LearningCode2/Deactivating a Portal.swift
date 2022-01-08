var switchesToggled = 0
greenPortal.isActive = false
while switchesToggled < 3 {
    if isOnClosedSwitch {
        toggleSwitch()
        switchesToggled += 1
        turnLeft()
        turnLeft()
    }
    if !isBlockedRight {
        turnRight()
    }
    moveForward()
}
