func turnAround() {
    //#-editable-code
    turnLeft()
    turnLeft()
    //#-end-editable-code
}

func solveStair() {
    //#-editable-code
    moveForward()
    collectGem()
    turnAround()
    moveForward()
    
    //#-end-editable-code
}
//#-editable-code
solveStair()
solveStair()
turnRight()
solveStair()
solveStair()

//#-end-editable-code
//#-hidden-code
playgroundEpilogue()
//#-end-hidden-code
