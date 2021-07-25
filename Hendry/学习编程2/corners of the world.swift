var switchCounter = 0
var gemCounter = 0
orangePortal.isActive=false
while gemCounter<6||switchCounter<6{
    if isOnGem {
        collectGem()
        gemCounter+=1
    }
    if isOnClosedSwitch {
        toggleSwitch()
        switchCounter+=1
    }
    if gemCounter==6&&switchCounter==2 {
        greenPortal.isActive=true
    }else if gemCounter<6||switchCounter>0  {
        greenPortal.isActive=false
    }
    if   isBlocked&&isBlockedLeft&&isBlockedRight {
        turnRight()
        turnRight()
        moveForward()
        turnLeft()
    }
    if isBlockedLeft&&isBlockedRight&&gemCounter==4 {
        turnLeft()
        turnLeft()
        moveForward()
        turnLeft() 
    }
    if isBlocked {
        turnRight()
    }
    moveForward()
    }
