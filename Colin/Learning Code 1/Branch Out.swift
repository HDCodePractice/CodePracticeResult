func moveFar() {
    moveForward()
    moveForward()
    moveForward()
    moveForward()
    moveForward()
    moveForward()
    moveForward()
}
for i in 1 ... 3 {
    moveForward()
    moveForward()
    turnRight()
    moveFar()
    toggleSwitch()
    turnLeft()
    turnLeft()
    moveFar()
    turnRight()
}
