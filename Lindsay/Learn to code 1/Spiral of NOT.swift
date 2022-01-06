func jugeMove() {
    if isOnClosedSwitch{
        toggleSwitch()
    }
        else if !isBlocked {
            moveForward()        
        }else if !isOnOpenSwitch{
            turnLeft()
        }
    }

for i in 1 ... 49 {
    jugeMove()
}
