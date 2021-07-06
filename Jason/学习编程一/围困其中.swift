moveForward()
func cort() {
    if isOnClosedSwitch {
        toggleSwitch()
        
    } else if isOnGem {
        collectGem()
    }
}
for i in 1 ... 4 {
    moveForward()
    cort()
    turnLeft()
    moveForward()
    cort()
}
moveForward()
cort()
