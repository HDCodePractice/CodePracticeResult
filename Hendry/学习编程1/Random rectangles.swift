while !isBlocked {
    moveForward()
    if isBlocked {
        turnRight() 
    }
    if isOnClosedSwitch {
        toggleSwitch() 
    }  
}
