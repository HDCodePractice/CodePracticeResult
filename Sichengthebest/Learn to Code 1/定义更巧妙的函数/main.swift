func collectOrToggle() {
    moveForward()
    if isOnClosedSwitch {
        toggleSwitch()
    }  else if isOnGem {
        collectGem()  
    }
}
func solveRow() {
    for i in 1 ... 4 {
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
