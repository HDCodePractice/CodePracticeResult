func Happy() {
    moveForward()
    collectOrToggle()
    turnRight()
}
func collectOrToggle() {
    if isOnClosedSwitch{
        toggleSwitch()
    }
    else if isOnGem{
        collectGem()
    }
}
    Happy()
for i in 1 ... 3 {
    Happy()
    moveForward()
    collectOrToggle()
}
    Happy()
