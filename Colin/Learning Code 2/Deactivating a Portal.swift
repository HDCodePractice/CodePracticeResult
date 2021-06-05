greenPortal.isActive = false 
func move(){
    moveForward()
    moveForward()
    moveForward()
}
for i in 1...3{
    move()
    turnLeft()
    move()
    toggleSwitch()
    turnRight()
    turnRight()
}
