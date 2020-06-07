func checkTile(){
    moveForward()
    if isOnGem{
        collectGem()
    } else if isOnClosedSwitch{
        toggleSwitch()
    }
}
moveForward()
turnLeft()
for i in 1 ... 4 {
    checkTile()
    turnLeft()
    checkTile()
}
