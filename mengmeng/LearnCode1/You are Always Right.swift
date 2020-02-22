func funForFun() {
    moveForward()
    for i in 1 ... 32 {
        if isOnClosedSwitch {
            toggleSwitch()
            moveForward()            
        } else {
            moveForward()           
        }
        if isBlocked {
            turnRight()
        }        
    }
}
funForFun()
collectGem()
