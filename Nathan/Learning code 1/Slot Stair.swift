func collectGemTurnAround() {
  moveForward()
  moveForward()
  collectGem()
  turnLeft()
  turnLeft()
  moveForward()
  moveForward()
}

func solveRow() {
  collectGemTurnAround()
  collectGemTurnAround()
  turnRight()
}
solveRow()
moveForward()
turnLeft()
solveRow()
moveForward()
turnLeft()
solveRow()
