greenPortal.isActive = false
orangePortal.isActive = false
turnLeft()
func cornergem() {
    if !isOnOpenSwitch{
        moveForward()
        collectGem()
        turnLeft()
        turnLeft()
        moveForward()
        turnRight()
    }
}
func cornerswitch() {
    if !isOnGem{
        moveForward()
        toggleSwitch()
        turnLeft()
        turnLeft()
        moveForward()
        turnLeft()
    }
}
moveForward()
moveForward()
cornergem()
cornergem()
turnLeft()
for i in 1 ... 3 {
    moveForward()
}
for i in 1 ... 4 {
    cornergem()
}
greenPortal.isActive = true
orangePortal.isActive = true
cornerswitch()
orangePortal.isActive = false
cornerswitch()
cornerswitch()
for i in 1 ... 4 {
    moveForward()
}
greenPortal.isActive = false
for i in 1 ... 4 {
    cornerswitch()
}
