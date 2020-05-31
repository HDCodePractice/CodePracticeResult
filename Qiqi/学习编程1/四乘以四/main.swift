func firstOne() {
    moveForward()
    moveForward()
    moveForward()
    if isOnClosedSwitch {
        toggleSwitch()      
    }
    turnRight()    
}
while !isBlocked {
    firstOne()    
}
