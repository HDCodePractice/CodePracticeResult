func getSwitch() {
    moveForward()
    toggleSwitch()
    moveForward()
    toggleSwitch()
}
func getGem() {
    moveForward()
    collectGem()
    moveForward()
    collectGem()
}
func turnBack() {
    turnLeft()
    turnLeft()
    moveForward()
    moveForward()
}
turnLeft()
for i in 1 ... 2 {
    getSwitch()
    turnBack()
    turnLeft()
    moveForward()
    turnLeft()
}
getSwitch()
turnBack()
for i in 1 ... 2 {
    getGem()
    turnBack()
    turnLeft()
    moveForward()
    turnLeft()
}
getGem()
