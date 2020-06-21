func collectOrCllect(){
    moveForward()
    if isOnGem {
        collectGem()
    }else if isOnClosedSwitch{ 
        toggleSwitch()
 }
func move4() {
    for i in 1 ... 4 {
        collectOrToggle()
 }
move4()
turnLeft()
moveForward()
moveForward()
turnLeft()
move4()
turnRight()
moveForward()
turnRight()
move4()
