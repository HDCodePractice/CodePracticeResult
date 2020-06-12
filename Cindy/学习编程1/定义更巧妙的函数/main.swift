func collectOrToggle() {
if isOnGem {
        collectGem()
    } else if isOnClosedSwitch {
        toggleSwitch()
    }
}
for i in 1...4{
    moveForward()
    collectOrToggle()
}
turnLeft()
moveForward()
moveForward()
turnLeft()
for i in 1...4{
    moveForward()
    collectOrToggle()
}
turnRight()
moveForward()
turnRight()
for i in 1...4{
    moveForward()
    collectOrToggle()
}
