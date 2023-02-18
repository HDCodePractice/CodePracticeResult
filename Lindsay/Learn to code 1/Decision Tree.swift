func loopGem () {
    moveForward()
    collectGem()
    turnRight()
    for i in 1 ... 3{
        moveForward()
    }
    turnLeft()
    moveForward()
    collectGem()
    turnLeft()
    turnLeft()
    moveForward()
    turnRight()
    for i in 1 ... 3 {
        moveForward()
    }
    turnRight()
    
}

func loopSwitchGem () {
    if isOnClosedSwitch{
        toggleSwitch()
        
    }else if isOnGem{
        collectGem()
        
    }
}
func getSwitchGem() {
    moveForward()
    loopSwitchGem()
    turnLeft()
    moveForward()
    loopSwitchGem()
    turnLeft()
    turnLeft()
    moveForward()
    turnLeft()
}

loopGem()
getSwitchGem()
moveForward()
loopSwitchGem()
loopGem()
getSwitchGem()

