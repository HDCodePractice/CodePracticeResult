let switchCounter = numberOfSwitches
var gem = 0
while gem < switchCounter {
    if isBlocked {
        turnRight()
    }
    else{
        moveForward()
        if isOnGem {
            collectGem()
            gem=gem+1
        }
        
    }
}
