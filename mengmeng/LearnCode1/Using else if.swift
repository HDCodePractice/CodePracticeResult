for i in 1 ... 2 {
    moveForward()
    if isOnClosedSwitch {
        toogleSwitch()
    } else if isOnGem {
        collectGem()
    }
}  
