var b = 0
while b < 5{
    moveForward()
    collectGem()
    if isBlocked {
        turnLeft()
        turnLeft()
        b+=1
        bluePortal.isActive=false
    }else{
        bluePortal.isActive=true
    }
    if b==3{
        pinkPortal.isActive=true
        bluePortal.isActive=false
    }else if b==4 {
        pinkPortal.isActive=false
    }
}
