purplePortal.isActive=false
for i in 1 ... 6 {
    moveForward()
    if isOnGem {
        collectGem()     
    }  
}
turnLeft()
turnLeft()
purplePortal.isActive=true
for i in 1 ... 6 {
    moveForward()
    if isOnClosedSwitch {
        toggleSwitch()     
    } 
}
purplePortal.isActive=false
turnLeft()
turnLeft()
for i in 1 ... 5 {
    moveForward()
    if isOnGem {
        collectGem()
    }
}
