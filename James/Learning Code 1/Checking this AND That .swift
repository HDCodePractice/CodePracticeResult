func bruh() {
    collectGem()
    turnRight()
    moveForward()
    moveForward()
    toggleSwitch()
    turnLeft()
    turnLeft()
    moveForward()
    moveForward()
    turnRight()
    
}
for i in 1 ... 7 {
    moveForward()
    if isOnGem && isBlockedLeft {
        bruh()
    } else if isOnGem {
        collectGem()
    }
    
}
