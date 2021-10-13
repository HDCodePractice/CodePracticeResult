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
for i in 1 ... 1 {
    Happy()
    Happy()
    moveForward()
    collectOrToggle()
    Happy()
    moveForward()
    collectOrToggle()
    Happy()
    moveForward()
    collectOrToggle()
    Happy()
}
