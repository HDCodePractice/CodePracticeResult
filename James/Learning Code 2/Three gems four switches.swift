var gemCounter = 0 
var switchCounter = 0
var totalswitch = 4
var totalgem = 3
    while switchCounter < totalswitch{
        if isBlocked && isBlockedLeft {
            turnRight()
        } else if isBlocked && isBlockedRight {
            turnLeft()
        }
        moveForward()
        if gemCounter < totalgem && isOnGem {
            collectGem()
            gemCounter = gemCounter  + 1
        } else if switchCounter < totalswitch && isOnClosedSwitch{
            toggleSwitch()
            switchCounter = switchCounter + 1
        }
    }
