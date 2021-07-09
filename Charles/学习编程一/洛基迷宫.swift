func get() {
    toggleSwitch()
    collectGem()
    turnRight()
    moveForward()
    moveForward()
    collectGem()
    turnLeft()
    turnLeft()
    moveForward()
    moveForward()
    turnRight()
    
}
for i in 1 ... 8 {
    moveForward()
    if isOnClosedSwitch&&isOnGem {
        get()
        
    }else if isOnClosedSwitch {
        toggleSwitch()
        turnLeft()
        
    }else if isOnGem {
        collectGem()
        
    }
    
    
    
}
