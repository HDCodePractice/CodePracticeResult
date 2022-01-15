func gem() {
    turnRight()
    moveForward()
    collectGem()
    moveForward()
    collectGem()
    turnLeft()
    turnLeft()
    moveForward()
    moveForward()
    
    
    
}

func  trap() {
    moveForward()
    toggleSwitch()
    
    moveForward()
    toggleSwitch()
    
    turnLeft()
    turnLeft()
    moveForward()
    moveForward()
    turnLeft()
    
}
for i in 1 ... 3 {
    gem()
    trap()
    moveForward()
    
}
