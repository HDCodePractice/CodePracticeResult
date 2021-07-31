
var gemCounter = 0
var switchCounter = 0
while gemCounter < 3 || switchCounter < 4 {
    if !isBlocked {
        moveForward()
        if isOnGem && gemCounter < 3{
            collectGem()
            gemCounter = gemCounter + 1
        } else if isOnClosedSwitch && switchCounter < 4 {
            toggleSwitch()
            switchCounter += 1
        }
    } else if !isBlockedRight {
        turnRight()
    } else if !isBlockedLeft {
        turnLeft()
    }
}
