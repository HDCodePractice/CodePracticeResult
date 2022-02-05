while !(isBlocked && isBlockedLeft && isBlockedRight) {
    
    if isOnOpenSwitch {
        turnRight()
        
    }
    if isOnClosedSwitch {
        toggleSwitch()
        turnRight()
    }
    moveForward()
    
    
}
toggleSwitch()


