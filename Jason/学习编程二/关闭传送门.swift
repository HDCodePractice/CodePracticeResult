greenPortal.isActive = false
for i in 1 ... 3 {
    moveForward()
}
func backgo() {
    moveForward()
    moveForward()
    moveForward()
    toggleSwitch()
}
func around() {
    turnLeft()
    turnLeft()
}

backgo()
around()
backgo()
turnRight()
backgo()
around()
backgo()
backgo()


