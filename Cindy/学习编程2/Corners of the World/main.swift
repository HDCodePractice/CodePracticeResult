func collectAll() {
    moveForward()
    for i in 1...4{
        if isOnGem{
            collectGem()
        } else if isOnClosedSwitch{
            toggleSwitch()
        }
        turnLeft()
        turnLeft()
        moveForward()
        turnRight()
        moveForward()
    }
    turnLeft()
    turnLeft()
}

greenPortal.isActive = false
turnLeft()
moveForward()
moveForward()
collectAll()
greenPortal.isActive = true
moveForward()
greenPortal.isActive = false
collectAll()
greenPortal.isActive = true
moveForward()
greenPortal.isActive = false
turnRight()
for i in 1 ... 4 {
    moveForward()
    orangePortal.isActive = false
}
collectAll()
orangePortal.isActive = true
moveForward()
moveForward()
orangePortal.isActive = false
collectAll()
