var gemCounter = 0 
var switchCounter = 0
for i in 1 ... 8 {
    while gemCounter < 3 || switchCounter < 4{
        moveForward()
        if gemCounter < 3 && isOnGem {
            collectGem()
        }
    }
    if isBlocked && isBlockedLeft {
        turnRight()
    } else if isBlocked && isBlockedRight {
        turnLeft()
    }
}
