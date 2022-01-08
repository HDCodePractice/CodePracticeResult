func goandToggle() {
    turnRight()
    moveForward()
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
    
    if isBlockedLeft&&isOnGem {
        collectGem()
        goandToggle()
        
    }else if isOnGem {
        collectGem()
        
    }
    
    
}
