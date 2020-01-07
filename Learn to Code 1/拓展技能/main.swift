func solveRow() {
    moveForward()
    moveForward()
    turnRight()
}
func forward7() {
    for i in 1 ... 7 {
        moveForward()
    }
    for i in 1 ... 3 {
        forward7()
        toggleSwitch()
        turnLeft()
        turnLeft()
        forward7()
        turnRight()
    }
    solveRow()    
}
