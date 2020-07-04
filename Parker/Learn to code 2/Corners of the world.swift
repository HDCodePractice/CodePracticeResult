func toggleOrCollect() {
    turnRight()
    moveForward()
    if isOnGem {
        collectGem()
    } else if isOnClosedSwitch {
        toggleSwitch()
    }
    turnRight()
    turnRight()
    moveForward()
}
orangePortal.isActive = false
greenPortal.isActive = false
turnRight()
moveForward()
moveForward()
toggleOrCollect()
orangePortal.isActive = true
toggleOrCollect()
orangePortal.isActive = false
for i in 1 ... 4 {
    toggleOrCollect()
}
turnLeft()
moveForward()
moveForward()
moveForward()
toggleOrCollect()
greenPortal.isActive = true
toggleOrCollect()
greenPortal.isActive = false
for i in 1  ... 4 {
    toggleOrCollect()
}
