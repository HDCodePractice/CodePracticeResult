greenPortal.isActive = false
func moves() {
    moveForward()
    moveForward()
    moveForward()
    turnRight()
}
for i in 1 ... 3 {
    moves()
    moves()
    toggleSwitch()
    turnRight()
}
