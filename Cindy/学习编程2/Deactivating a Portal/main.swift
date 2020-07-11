greenPortal.isActive = false
func moveThree(){
    moveForward()
    moveForward()
    moveForward()
}
for i in 1...3{
    moveThree()
    turnLeft()
    moveThree()
    toggleSwitch()
    turnLeft()
    turnLeft()
}
