func moveOrToggleOrCollect() {
    moveForward()
    if isOnClosedSwitch {
        toggleSwitch()        
    }
    if isOnGem {
        collectGem()        
    }    
}
func chiYiHang() {
    while !isBlocked {
        moveOrToggleOrCollect()        
    }
}
chiYiHang()
turnRight()
moveForward()
turnRight()
chiYiHang()
turnLeft()
moveForward()
turnLeft()
chiYiHang()
