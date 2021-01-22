func collectOrToggle() {
   if isOnClosedSwitch {
      toggleSwitch()
   }else if isOnGem {
    collectGem()
   }
}

func go() {
    for i in 1 ... 4 {
        moveForward()
        collectOrToggle()
    }
}
go()
turnLeft()
moveForward()
moveForward()
turnLeft()
go()
turnRight()
moveForward()
turnRight()
go()
