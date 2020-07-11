var gemCounter = 0
var switchCounter = 0
while gemCounter < 3 || switchCounter < 3 {
    moveForward  ()
    if isOnGem && gemCounter < 3{
        collectGem()
        gemCounter += 1
    } 
    if isOnClosedSwitch && switchCounter < 3{
        toggleSwitch()
        switchCounter += 1
    }
    if isBlocked {
        turnRight()
    }
}
