func decisionOfToggleOrCollect() {
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
decisionOfToggleOrCollect()
orangePortal.isActive = true
decisionOfToggleOrCollect()
orangePortal.isActive = false
for i in 1 ... 4 {
    decisionOfToggleOrCollect()
}
turnLeft()
moveForward()
moveForward()
moveForward()
decisionOfToggleOrCollect()
greenPortal.isActive = true
decisionOfToggleOrCollect()
greenPortal.isActive = false
for i in 1  ... 4 {
    decisionOfToggleOrCollect()
}
