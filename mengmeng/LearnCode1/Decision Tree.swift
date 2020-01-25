func collectOrToggle() {
    if isOnGem {
        collectGem()        
    } else if isOnClosedSwitch {
        toggleSwitch()       
    } 
}
func solveRight() {
    turnRight()
    moveForward()
    moveForward()
    moveForward()
    turnLeft()
    moveForward()
    collectOrToggle()
    turnRight()
    turnRight()
    moveForward()
    turnRight()
    moveForward()
    moveForward()
    moveForward()
    turnRight()    
}
func solveLeft() {
    turnLeft()
    moveForward()
    collectOrToggle()
    turnRight()
    turnRight()
    moveForward()
    turnLeft()
} 
    moveForward()
    collectOrToggle()
    solveRight()
    moveForward()
    collectOrToggle()
    solveLeft()
    moveForward()
    collectOrToggle()
    moveForward()
collectOrToggle()
solveRight()
moveForward()
collectOrToggle()
solveLeft()
