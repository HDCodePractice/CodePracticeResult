for i in 1...12{
    moveForward()
    if isOnClosedSwitch {
        toggleSwitch()
        turnRight()
    } else if isOnOpenSwitch  {
        turnRight()
        }
    }
