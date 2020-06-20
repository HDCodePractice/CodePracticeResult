func checkTheSwitch() {
    if isOnClosedSwitch {
        toggleSwitch()
    }
}
while !isOnGem {
    while !isBlocked {
        moveForward()
        checkTheSwitch()
    }
    turnRight()
}
collectGem()
