while !isBlocked {
    moveForward()
    while isOnClosedSwitch {
        toggleSwitch()
    }
    if isBlocked{
        turnRight()
    }
    if isOnGem {
        collectGem()
    }
    
}
