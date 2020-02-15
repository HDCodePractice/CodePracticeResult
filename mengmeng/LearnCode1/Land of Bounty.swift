func threeForFun() {
    moveForward()
    moveForward()
    moveForward()
    if isOnClosedSwitch {
        toggleSwitch()        
    }
    turnRight()   
}
while !isBlocked {
    threeForFun()   
}
