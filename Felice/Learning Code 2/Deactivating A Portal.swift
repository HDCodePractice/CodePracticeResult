greenPortal.isActive = false
func moveAndToggleSwitch() {
    for i in 1 ... 3 {
        moveForward()
    }
    turnRight()
}
for i in 1 ... 3 {
    moveAndToggleSwitch()
    moveAndToggleSwitch()
    toggleSwitch()
    turnRight()
}
