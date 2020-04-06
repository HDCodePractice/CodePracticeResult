func collectGemTurnAround() {
    //#-editable-code
    moveForward()
    moveForward()
    collectGem()
    turnLeft()
    turnLeft()
    moveForward()
    moveForward()
    //#-end-editable-code
}

func solveRow() {
    //#-editable-code
    collectGemTurnAround()
    collectGemTurnAround()
    //#-end-editable-code
}
//#-editable-code
solveRow()
turnRight()
moveForward()
turnLeft()
solveRow()
turnLeft()
moveForward()
turnLeft()
solveRow()

//#-end-editable-code
//#-hidden-code
playgroundEpilogue()
//#-end-hidden-code
