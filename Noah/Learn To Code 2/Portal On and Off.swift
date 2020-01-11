var gemCounter = 0

purplePortal.isActive = false

while !isOnClosedSwitch {
    if isOnGem {
        collectGem()
        gemCounter += 1
    }
    if isBlocked {
        if gemCounter == 7 {
            turnRight()
            turnRight()
            for i in 1 ... 4 {
                moveForward()
            }
        }
        if gemCounter == 4 {
            turnRight()
            turnRight()
            purplePortal.isActive = true
            for i in 1 ... 4 {
                moveForward()
            }
            turnRight()
            turnRight()
            purplePortal.isActive = false
        }
    }
    moveForward()
}
toggleSwitch()
