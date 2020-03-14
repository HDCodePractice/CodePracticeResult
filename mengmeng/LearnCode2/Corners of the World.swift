func collectGemOrToggleSwitch() {
    moveForward()
    if isOnGem {
        collectGem()
    }
    if isOnClosedSwitch {
        toggleSwitch()
    }
    turnRight()
    turnRight()
}
func solveACross() {
    collectGemOrToggleSwitch()
    moveForward()
    turnRight()
    collectGemOrToggleSwitch()
    moveForward()
    collectGemOrToggleSwitch()
    moveForward()
    turnLeft()
    moveForward()
}
func goPortal() {
    moveForward()
    moveForward()
    collectGemOrToggleSwitch()
    moveForward()
    turnLeft()
    collectGemOrToggleSwitch()
}

turnRight()
orangePortal.isActive = false 
goPortal()
orangePortal.isActive = true
moveForward()
orangePortal.isActive = false
solveACross()
collectGem()
greenPortal.isActive = false
goPortal()
greenPortal.isActive = true 
moveForward()
greenPortal.isActive = false
solveACross()
toggleSwitch()
    
