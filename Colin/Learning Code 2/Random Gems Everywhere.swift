let totalGems = randomNumberOfGems
var gemCounter = 0
while totalGems != gemCounter{
    moveForward()
    if isOnGem{
        collectGem()
        gemCounter+=1
    }
    if isBlocked{
        turnLeft()
        turnLeft() 
        if isOnGem{
            collectGem()
            gemCounter+=1
        }
        pinkPortal.isActive=false
        bluePortal.isActive=false
        for i in 1...4{
            moveForward()
            if isOnGem{
                collectGem()
                gemCounter+=1
            }
        }
        turnRight()
        turnRight()
    }
    pinkPortal.isActive=true
    bluePortal.isActive=true
}
