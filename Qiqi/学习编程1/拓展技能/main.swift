func sevenM() {
    for g in 1 ... 7{
        moveForward()
    }
}
func moveToggle() {
    moveForward()
    moveForward()
    turnRight()
    sevenM()
    toggleSwitch()
}
for i in 1 ... 2 {
    moveToggle()
    turnLeft()
    turnLeft()
    sevenM()
    turnRight()
}
moveToggle()
