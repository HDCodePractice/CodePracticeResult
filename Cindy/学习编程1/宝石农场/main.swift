func turnAround() {
    turnLeft()
    turnLeft()
}
func collectTheGem() {
    moveForward()
    collectGem()
    moveForward()
    collectGem()
}
for i in 1...3{
    turnLeft()
    moveForward()
    toggleSwitch()
    moveForward()
    toggleSwitch()
    turnAround()
    moveForward()
    moveForward()
    turnLeft()
    moveForward()
}
turnAround()
moveForward()
for i in 1...2{
    turnLeft()
    collectTheGem()
    turnAround()
    moveForward()
    moveForward()
    turnLeft()
    moveForward()
    
}
turnLeft()
collectTheGem()
