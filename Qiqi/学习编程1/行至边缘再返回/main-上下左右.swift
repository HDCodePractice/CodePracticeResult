func turnAround() {
    turnLeft()
    turnLeft()
}
func getMmtt() {
    moveForward()
    moveForward()
    toggleSwitch()
    turnAround()
}
func oneLine() {
    getMmtt()
    moveForward()
    moveForward()
    getMmtt()
    moveForward()
    moveForward()
}
for i in 1 ... 2 {
    oneLine()
    turnLeft()
}
