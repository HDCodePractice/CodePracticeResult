while !isBlocked {
    moveForward()
    if isOnGem {
        collectGem()
        turnLeft()
        
    }else{
        turnRight()
        
    }
    
    
}
