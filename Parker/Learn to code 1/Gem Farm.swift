func turnAround() {
      turnLeft()
    turnLeft()
}

for i in 1 ... 3 {
    turnLeft()
    moveForward()
    toggleSwitch()
    moveForward()
    toggleSwitch()
    turnAround()
    moveForward()
    moveForward()
    moveForward()
    collectGem()
    moveForward()
    collectGem()
    turnAround()
    moveForward()
    moveForward()
    turnRight()
    moveForward()
}
