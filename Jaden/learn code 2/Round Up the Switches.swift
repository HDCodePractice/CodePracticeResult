var gemCounter = 1
var tog = 0
while tog != gemCounter{
    moveForward()
    if isBlocked {
        turnRight()
        
    }
    if isOnGem{
        collectGem()
        gemCounter+=1
    }
    if isOnClosedSwitch{
        toggleSwitch()
        tog+=1
    }
    if tog == 1{
        gemCounter-=1
    }
    
}
