func getGem() {
    turnRight()
    moveForward()
    collectGem()
    moveForward()
    collectGem()
    turnRight()
    turnRight()
    moveForward()
    moveForward()   
}
func getSwitch() {
    moveForward()
    toggleSwitch()
    moveForward()
    toggleSwitch()
    turnRight()
    turnRight()
    moveForward()
    moveForward()
    turnLeft()   
}
for i in 1 ... 3 {
    getGem()
    getSwitch()
    moveForward()   
}
