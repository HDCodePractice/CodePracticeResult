var switchcounter = 0
func getGem() {
    for i in 1 ... 9 {
        moveForward()
        collectGem()
        if isBlocked {
            turnLeft()
            turnLeft()
        }
    }
}
    getGem()
    purplePortal.isActive = false
    getGem()
    purplePortal.isActive=true
for i in 1 ... 4 {
    moveForward()
}
toggleSwitch()
