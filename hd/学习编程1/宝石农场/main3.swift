func getGemSwitch() {
    moveForward()
    collectGem()
    toggleSwitch()
    moveForward()
    collectGem()
    toggleSwitch()
}
func turnBack() {
    turnLeft()
    turnLeft()
    moveForward()
    moveForward()
}
turnLeft()
for i in 1 ... 2 {
    getGemSwitch()
    turnBack()
    turnLeft()
    moveForward()
    turnLeft()
}
getGemSwitch()
turnBack()
for i in 1 ... 2 {
    getGemSwitch()
    turnBack()
    turnLeft()
    moveForward()
    turnLeft()
}
getGemSwitch()
