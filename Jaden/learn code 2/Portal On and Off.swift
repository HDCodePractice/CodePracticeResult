purplePortal.isActive=false
var gem = 0
var tog = 0
while gem<7{
    moveForward()
    if isOnGem{
        collectGem()
        gem+=1
    }

    if isBlocked{
        turnLeft()
        turnLeft()
        
    }

    if isOnClosedSwitch{
        toggleSwitch()
        purplePortal.isActive=false
        tog+=1
    }else if gem == 4{
        purplePortal.isActive = true
    }
    if tog == 1{
        purplePortal.isActive = false
    }
    }
