greenPortal.isActive = false
func toggleOneSwitchThenBack() {
    for i in 1 ... 3 {
        moveForward()
    }
    toggleSwitch()
    turnRight()
    turnRight()
    for i in 1 ... 3 {
        moveForward()
    }
}

for i in 1 ... 3 {
    moveForward()
}
toggleOneSwitchThenBack()
turnRight()
toggleOneSwitchThenBack()
toggleOneSwitchThenBack()
