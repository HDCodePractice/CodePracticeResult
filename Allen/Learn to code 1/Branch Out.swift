for i in 1 ... 3 {
    for i in 1 ... 2 {
        moveForward()
    }
    turnRight()
    for i in 1 ... 7 {
        moveForward()
    }
    toggleSwitch()
    for i in 1 ... 2 {
        turnLeft()
    }
    for i in 1 ... 7 {
        moveForward()
    }
    turnRight()
}
