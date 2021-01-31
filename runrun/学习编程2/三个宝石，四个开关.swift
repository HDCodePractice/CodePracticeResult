var gemCounter = 0
var togCounter = 0
while gemCounter < 3 || togCounter < 4 {
    moveForward()
    if isBlocked && isBlockedLeft {
        turnRight()
    }
    if isBlocked && isBlockedRight {
        turnLeft()
    }
    if isOnGem {
        if gemCounter < 3 {
            collectGem()
            gemCounter=gemCounter+1
        }  
    }
    if isOnClosedSwitch {
        if togCounter < 4 {
            toggleSwitch()
            togCounter=togCounter+1
        }
    } 
}
