func nav() {
    if isBlockedRight && isBlocked{
        turnLeft()
        
    }else if isBlockedRight{
        moveForward()
        
    }else{
        turnRight()
        moveForward()
        
    }
}
while !isOnGem {
    nav()
    
}
collectGem()
