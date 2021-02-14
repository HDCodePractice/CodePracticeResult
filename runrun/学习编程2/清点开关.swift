var gemCouter = 0          
var togGouter = 0
while  gemCouter==0 || gemCouter != togGouter
{
    moveForward()
    if isBlocked {
        turnRight()
    }
    if gemCouter < 7 {
        if isOnGem {
            collectGem()
            gemCouter += 1
        }
    }
    if togGouter < gemCouter {
        if isOnClosedSwitch{
            toggleSwitch()
            togGouter += 1
        }
    }
}
