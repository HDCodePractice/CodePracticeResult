func solveShort() {
    getMT()
    turnAround()
    moveForward()
    moveForward()
}
func solveLong() {
    getMT()
    getMT()
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
func getMT() {
    moveForward()
    moveForward()
    toggleSwitch()
}
solveShort()
solveShort()
turnRight()
solveLong()
solveLong()
