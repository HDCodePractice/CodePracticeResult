func collectOrToggle() {
  if isOnClosedSwitch {
        toggleSwitch()
    }
    else if isOnGem{
        collectGem()
    }
}
func Loop (){
    moveForward()
    moveForward()
    collectOrToggle()
}
Loop()
Loop()
turnLeft()
moveForward()
moveForward()
turnLeft()
Loop()
Loop()
turnRight()
moveForward()
turnRight()
Loop()
Loop()
