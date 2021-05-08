func turnThenToggleOrGem() {
    turnRight()
    moveForward()
    if isOnGem {
        collectGem()
    } else if isOnClosedSwitch {
        toggleSwitch()
    }
    turnRight()
    turnRight()
    moveForward()
}
orangePortal.isActive = false
greenPortal.isActive = false

turnRight()
moveForward()
moveForward()
turnThenToggleOrGem()
orangePortal.isActive = true
turnThenToggleOrGem()
orangePortal.isActive = false
for i in 1 ... 4 {
    turnThenToggleOrGem()
}
turnLeft()
moveForward()
moveForward()
moveForward()
turnThenToggleOrGem()
greenPortal.isActive = true
turnThenToggleOrGem()
greenPortal.isActive = false
for i in 1  ... 4 {
    turnThenToggleOrGem()
}
