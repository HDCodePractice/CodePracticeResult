var gemCounter = 0
var swtichCounter = 0
func position() {
    if isBlocked&&isBlockedLeft {
        turnRight()
    }else if isBlocked {
        turnLeft()
    }else{
        moveForward()
    }
}
while gemCounter<3||swtichCounter<4 {
    position()
    if gemCounter<3&&isOnGem {
        collectGem()
        gemCounter=gemCounter+1
    }
    if swtichCounter<4&&isOnClosedSwitch {
        toggleSwitch()
        swtichCounter=swtichCounter+1
    }
}
