var gem = 0
while gem < 7 {
    moveForward()
    if isBlocked {
        turnLeft()
        turnLeft()
        
    }
    if isOnGem{
        collectGem()
        gem+=1
    }
    
}
