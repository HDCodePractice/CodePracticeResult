let totalGems = randomNumberOfGems
var gem = 0
while gem < totalGems{
    moveForward()
    if isOnGem {
        collectGem()
        gem+=1
    }
    if isBlocked {
        turnLeft()
        turnLeft()
        if pinkPortal.isActive==true {
            pinkPortal.isActive=false
        }else if pinkPortal.isActive==false {
            pinkPortal.isActive=true
        }
        if bluePortal.isActive==true {
            bluePortal.isActive=false
        }else if bluePortal.isActive==false {
            bluePortal.isActive=true
        }
    }
}
