func MasterCode() {
    if isOnGem {
        collectGem()
    }
    else if isOnClosedSwitch {toggleSwitch()
    }
    
}
func MegaMasterCode() {
    MasterCode()
    if isBlocked {
        turnLeft()
    }
    moveForward()
}
moveForward()
for i in 1 ... 9 {
    MegaMasterCode()
}
