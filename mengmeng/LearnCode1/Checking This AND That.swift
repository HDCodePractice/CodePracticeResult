for i in 1 ... 7 {
    moveForward()
    if isOnGem && isBlockedLeft {
        collectGem()
        turnRight()
        for i in 1 ... 2 {
            moveForward()         
        }
        toggleSwitch()
        turnRight()
        turnRight()
        for i in 1 ... 2 {
            moveForward()     
        }
        turnRight()        
    } else if isOnGem {
        collectGem()       
    }   
}

