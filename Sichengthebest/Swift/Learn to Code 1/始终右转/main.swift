func check() {
    if isOnClosedSwitch {
        toggleSwitch()
    }
}

while !isOnGem {
    while !isBlocked {
        moveForward()
        check()
        
    }
    turnRight()
}
collectGem()
