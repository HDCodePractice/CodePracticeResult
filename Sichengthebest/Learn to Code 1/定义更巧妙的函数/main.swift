func collectOrToggle() {
    if isOnClosedSwitch {
        toggleSwitch()        
    }
        else if isOnGem {
        collectGem()
    }
    moveForward()
}
func solveRow() {
    for i in 1 ... 5 {
        collectOrToggle()       
    }
}
solveRow()
turnLeft()
moveForward()
moveForward()
turnLeft()
solveRow()
turnRight()
moveForward()
turnRight()
solveRow()
