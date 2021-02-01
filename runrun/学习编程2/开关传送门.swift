var gem = 0
purplePortal.isActive=false
func go() {
    turnLeft()
    turnLeft()
}
func colleOrTog() {
    moveForward()
    if isOnGem {
        collectGem()
        gem+=1
        if gem > 1{
            purplePortal.isActive=true
        }
    }
    if isOnClosedSwitch{
        toggleSwitch()
        purplePortal.isActive=false
    }
    if isBlocked {
        go()
    }
}

while gem < 7{
    colleOrTog()
}
