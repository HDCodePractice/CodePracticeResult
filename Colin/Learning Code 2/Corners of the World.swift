orangePortal.isActive=false
greenPortal.isActive=false
func move(){
    moveForward()
    moveForward()
    moveForward()
}
func turnAround(){
    turnLeft()
    turnLeft()
}
func thing1() {
    thing2()
    turnAround()
    moveForward()
}
func thing2(){
    if isOnGem{
        collectGem()
    } else if isOnClosedSwitch{
        toggleSwitch()
    }
}
func thing3() {
    for i in 1...4{
        moveForward()
        thing1()
        turnRight()
    }
}
turnRight()
move()
thing1()
turnLeft()
moveForward()
orangePortal.isActive=true
thing1()
orangePortal.isActive=false
thing3()
turnAround()
move()
thing3()
greenPortal.isActive=true
moveForward()
turnAround()
moveForward()
greenPortal.isActive=false
thing3()
