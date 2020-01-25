func a() {
    if isOnGem {
        collectGem()
    } else if isOnClosedSwitch {
        toggleSwitch()
    } 
    if isBlocked {
        turnLeft()
    }
    moveForward()
}
moveForward()
for i in 1 ... 9 {
    a()   
}
