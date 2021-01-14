func solveShort() {
    toggle()
    turnAround()
    moveForward()
    moveForward()
}
func solveLong() {
    toggle()
    toggle()
    turnAround()
    moveForward()
    moveForward()
    moveForward()
    moveForward()
}

func turnAround() {
    turnLeft()
    turnLeft()
}
func toggle() {
    moveForward()
    moveForward()
    toggleSwitch()
}
solveShort()
solveShort()
turnRight()
solveLong()
solveLong()
