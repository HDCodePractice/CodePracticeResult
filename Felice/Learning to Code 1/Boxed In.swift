func abc() {
    if isOnGem {
        collectGem()
    }else if isOnClosedSwitch {
        toggleSwitch()
    }
}
for i in 1 ... 10 {
    moveForward()
    abc()
    if isBlocked {
        turnRight()
    }
}
