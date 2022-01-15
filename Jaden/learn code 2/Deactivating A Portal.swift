greenPortal.isActive = false
var tog = 0
while tog<3 {
    moveForward()
    if isBlocked{
        turnLeft()
        turnLeft()
        
    }
    if !isBlockedRight{
        turnRight()
        
    }
    if isOnClosedSwitch{
        toggleSwitch()
        tog+=1
    }
}
