bluePortal.isActive = false
pinkPortal.isActive = false
var gem = 0
while gem<4 {
    moveForward()
    if gem == 1{
        pinkPortal.isActive = true
    }
    if isOnGem{
        collectGem()
        gem+=1
    }
    if isBlocked{
        turnLeft()
        turnLeft()
        
    }
    if gem == 2{
        bluePortal.isActive = true
    }
    if gem == 3{
        bluePortal.isActive = false
    }
}
