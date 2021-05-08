moveForward()
for i in 1 ... 4 {
if isBlocked {
    collectGem()
    turnLeft()
}
moveForward()
collectGem()
  if isBlocked && isBlockedRight {
      turnLeft()
      moveForward()
      turnRight()
      moveForward()
    }
} 
