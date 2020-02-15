for i in 1 ... 12 {
    moveForward()
    if isBlocked {
        turnRight()        
    } else if isBlockedLeft {
        turnRight()     
    }
    collectGem()    
}
