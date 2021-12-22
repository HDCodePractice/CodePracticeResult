func right() {
    collectGem()
    turnRight()
    moveForward()
    moveForward()
    moveForward()
    turnLeft()
    moveForward()
    collectGem()
    turnLeft()
    turnLeft()
    moveForward()
    turnRight()
    moveForward()
    moveForward()
    moveForward()
}
func left(){
    turnLeft()
    moveForward()
    collectGem()
    turnLeft()
    turnLeft()
    moveForward()
    toggleSwitch()
    turnLeft()
    moveForward()
}

for i in 1 ... 2 {
    moveForward()
    if isOnGem {
        right()
    }
    turnRight()
    moveForward()
    if isOnClosedSwitch {
        left()
        
    }
    

    
}
