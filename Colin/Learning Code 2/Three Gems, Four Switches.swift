var gemCounter=0
var switchCounter=0
while gemCounter<3||switchCounter<4{
    moveForward()
    if isOnGem{
        collectGem()
        gemCounter=gemCounter+1
    }
    if isBlocked && isBlockedLeft{
        turnRight()
    } else if isBlocked && isBlockedRight{
        turnLeft()
    }
    if gemCounter==3{
        while !isBlocked{
            moveForward()
            if isBlocked && isBlockedLeft{
                turnRight()
            } else if isBlocked && isBlockedRight{
                turnLeft()
            }
            if isOnClosedSwitch {
                toggleSwitch()
                switchCounter=switchCounter+1
            }
            if switchCounter==4{
                turnLeft()
            }
        }
    }
}
