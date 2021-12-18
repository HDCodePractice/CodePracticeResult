func Move7() {
    for j in 1 ... 7{
        moveForward()
    }
}
func moveToggle() {
    moveForward()
    moveForward()
    turnRight()
    Move7()
    toggleSwitch()
}
for i in 1 ... 2 {
    moveToggle()
    turnLeft()
    turnLeft()
    Move7()
    turnRight()
}
moveToggle()
