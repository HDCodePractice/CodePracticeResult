greenPortal.isActive = false
func speed() {
    moveForward()
    moveForward()
    moveForward()
}
speed()
for i in 1 ... 3 {
    turnRight()
    speed()
    toggleSwitch()
    turnRight()
    turnRight()
    speed()
}
