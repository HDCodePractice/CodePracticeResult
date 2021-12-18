greenPortal.isActive = false
orangePortal.isActive = false
var gemCounter = 0
var switchCounter = 0
func a() {
    if isOnClosedSwitch {
        toggleSwitch()
        switchCounter+=1
    }
    if isOnGem {
        collectGem()
        gemCounter+=1
    }
}
func position() {
    if !isBlockedRight {
        turnRight()
    }else if isBlocked {
        turnLeft()
        turnLeft()
    }
    moveForward()
    a()
}
while gemCounter<6 {
    position()
}
turnRight()
turnRight()
greenPortal.isActive = true
moveForward()
greenPortal.isActive = false
while switchCounter<6 {
    position()
}
