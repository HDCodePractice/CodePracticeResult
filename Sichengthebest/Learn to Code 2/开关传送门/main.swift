purplePortal.isActive = false
func forwardThenCollect() {
    moveForward()
    collectGem()
}

moveForward()
moveForward()
for i in 1 ... 4 {
    forwardThenCollect()
    
}
purplePortal.isActive = true
turnRight()
turnRight()
for i in 1 ... 6 {
    moveForward()
}
toggleSwitch()
turnRight()
turnRight()
purplePortal.isActive = false
moveForward()
moveForward()
for i in 1 ... 3 {
    forwardThenCollect()
}
