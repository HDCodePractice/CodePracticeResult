purplePortal.isActive=false
for i in 1 ... 6 {
    moveForward()
    if isOnGem {
        collectGem()
    }
}
turnRight()
turnRight()
purplePortal.isActive=true
for i in 1 ... 6 {
    moveForward()
}
toggleSwitch()
turnRight()
turnRight()
purplePortal.isActive=false
for i in 1 ... 5 {
    moveForward()
    if isOnGem {
        collectGem()
    }
}
