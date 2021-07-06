func collectOrToggle() {
  if isOnGem {
        collectGem()
    }
    else if isOnClosedSwitch {
        toggleSwitch()
    }
    moveForward()
}
for i in 1 ... 5 {
    collectOrToggle()
}
collectGem()
turnLeft()
moveForward()
moveForward()
turnLeft()
for i in 1 ... 5 {
    collectOrToggle()
}
turnRight()
moveForward()
turnRight()
for i in 1 ... 5 {
    collectOrToggle()
}
