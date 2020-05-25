func navigateAroundWall() {
 if isBlocked && isBlockedRight{
  turnLeft()
 } else if isBlockedRight {
  moveForward()
 } else {
  turn Right()
  moveForward()
 }
}

while !isOnOpenSwitch {
 while !isOnGem && !isOnClosedSwitch }
  navigateAroundWall()
 }
 if isOnGem {
  collectGem()
 } else {
  toggleSwitch()
 }
 turnLeft()
 turnLeft()
}
