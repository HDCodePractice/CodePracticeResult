var gemCounter = 0
while gemCounter<4 {
    if isOnGem {
        collectGem()
        gemCounter+=1
    }
    if gemCounter==0 {
        bluePortal.isActive=false
        pinkPortal.isActive=false
    }
    if gemCounter==1 {
        bluePortal.isActive=true
        pinkPortal.isActive=true
    }
    if gemCounter==3 {
        bluePortal.isActive=false
    }
    moveForward()
    if isBlocked {
        turnLeft()
        turnLeft()  
    }
}
