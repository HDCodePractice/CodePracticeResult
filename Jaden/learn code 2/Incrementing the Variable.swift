var gemCounter = 0
for i in 1 ... 16 {
    moveForward()
    if isOnGem {
        collectGem()
        gemCounter += 1
        if isBlocked {
            turnRight()
            
        }
        
    }
    
}

