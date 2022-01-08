var gemCounter = 0
var switchCounter = 0
while !isBlocked{
    if isOnGem {
        collectGem()
        gemCounter+=1
    }
    moveForward()
    if isBlocked&&isBlockedLeft {
        turnRight()    
    }
    if isOnClosedSwitch&&switchCounter<gemCounter{
        toggleSwitch()
        switchCounter+=1
        if switchCounter==gemCounter{
        turnLeft()}
}
}
