for i in 1 ... 13 {
    moveForward()
    if isBlocked {
        turnLeft()    
    }  
}
if isOnClosedSwitch {
    toggleSwitch() 
}
