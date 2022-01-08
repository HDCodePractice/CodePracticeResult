var gemCounter = 0
bluePortal.isActive = false
pinkPortal.isActive = false
while gemCounter<4 {
    if isBlocked {
        turnLeft()
        turnLeft()
    }else{
        moveForward()
        if isOnGem {
            collectGem()
            gemCounter+=1
            if gemCounter==1 {
                bluePortal.isActive = true
                pinkPortal.isActive = true
        }
            if gemCounter==3 {
                bluePortal.isActive = false
        }
}
}
}
