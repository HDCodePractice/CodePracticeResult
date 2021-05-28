greenPortal.isActive = false
func move() {
    moveForward()
    moveForward()
    moveForward()
    turnRight()
}
for i in 1 ... 3 {
    move()
    move()
    toggleSwitch()
    turnRight()
}
