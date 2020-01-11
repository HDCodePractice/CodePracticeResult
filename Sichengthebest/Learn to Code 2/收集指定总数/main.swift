var gems = 0
let totalGems = randomNumberOfGems

while gems < totalGems {
    if isOnGem {
        collectGem()
        gems += 1
        
    } else {
        moveForward()
    }
    if isBlocked && !isBlockedRight {
        turnRight()
        
    } else if isBlockedRight && isBlocked && !isBlockedLeft {
        turnLeft()
        
    } else if isBlocked && isBlockedLeft && isBlockedRight {
        turnLeft()
        turnLeft()
    }
}
