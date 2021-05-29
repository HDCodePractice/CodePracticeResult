func isSwitchOrCollect() {
    if isOnGem {
        collectGem()
    } else if isOnClosedSwitch {
        toggleSwitch()
    }
}
moveForward()
isSwitchOrCollect()
turnLeft()
moveForward()
isSwitchOrCollect()
for i in 1...3{
    turnLeft()
    moveForward()
    isSwitchOrCollect()
    moveForward()
    isSwitchOrCollect()
}
