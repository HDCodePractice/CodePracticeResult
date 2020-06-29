purplePortal.isActive = false
for i in 1 ... 6 {
    moveForward()
    collectGem()
}
turnLeft()
turnLeft()
purplePortal.isActive = true
for j in 1 ... 5 {
    moveForward()
}
moveForward()
toggleSwitch()
turnLeft()
turnLeft()
purplePortal.isActive = false
for k in 1 ... 5 {
    moveForward()
    collectGem()
}
