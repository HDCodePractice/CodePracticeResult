func move7(){
    for i in 1...7{
        moveForward()
    }
}
func moveAndComeBack(){
    move7()
    toggleSwitch()
    turnLeft()
    turnLeft()
    move7()
}
for i in 1...2{
    moveForward()
    moveForward()
    turnRight()
    moveAndComeBack()
    turnRight()
}
moveForward()
moveForward()
turnRight()
move7()
toggleSwitch()
