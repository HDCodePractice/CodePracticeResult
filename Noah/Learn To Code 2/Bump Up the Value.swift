var gemCounter = 0

while !isBlocked {
    moveForward()
    while isOnGem {
        collectGem()
        moveForward()
        if isBlocked {
            collectGem()
        }
    }
} 
gemCounter = 5
