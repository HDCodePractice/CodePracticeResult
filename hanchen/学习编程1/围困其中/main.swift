func collectortoggle() {
    moveForward()
    if isOnGem {
        collectGem()
    }else if isOnClosedSwitch {
        toggleSwitch()
    }
}
collectortoggle()
turnLeft()
collectortoggle()
turnLeft()
for i in 1 ... 3 {
    collectortoggle()
    collectortoggle()
    turnLeft()
    
}
