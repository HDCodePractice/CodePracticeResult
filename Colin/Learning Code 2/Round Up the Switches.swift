var gemCounter=0
while !isOnClosedSwitch{
    moveForward()
    if isOnGem{
        collectGem()
        gemCounter+=1
    }
    if isBlocked{
        turnRight()
    }
}
while gemCounter>0{
    if isBlocked{
        turnRight()
    }
    if isOnClosedSwitch{
        toggleSwitch()
        gemCounter=gemCounter-1
    }
    moveForward()
    if gemCounter==0{
        turnLeft()
    }
}
