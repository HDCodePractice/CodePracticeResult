greenPortal.isActive = false
func go() {
    moveForward()
    moveForward()
    moveForward()
    turnRight()
}
for i in 1 ... 3{
    go()
    go()
    toggleSwitch()
    turnRight()
}
