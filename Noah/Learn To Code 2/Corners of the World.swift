func NoahIsTheBest() {
    moveForward()
    if isOnGem {
        collectGem()
    }
    if isOnClosedSwitch {
        toggleSwitch()
    }
    turnRight()
    turnRight()
}
func yayfinale() {
    NoahIsTheBest()
    moveForward()
    turnRight()
    NoahIsTheBest()
    moveForward()
    NoahIsTheBest()
    moveForward()
    turnLeft()
    moveForward()
}
func hahahhahaha() {
    moveForward()
    moveForward()
    NoahIsTheBest()
    moveForward()
    turnLeft()
    NoahIsTheBest()
}

turnRight()
orangePortal.isActive = false 
hahahhahaha()
orangePortal.isActive = true
moveForward()
orangePortal.isActive = false
yayfinale()
collectGem()
greenPortal.isActive = false
hahahhahaha()
greenPortal.isActive = true 
moveForward()
greenPortal.isActive = false
yayfinale()
toggleSwitch(
