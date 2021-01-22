for i in 1 ... 12 {
  moveForward()
  if isOnGem {
    collectGem()
   }else if isOnClosedSwitch {
    ToggleSwitch()
  }
}
